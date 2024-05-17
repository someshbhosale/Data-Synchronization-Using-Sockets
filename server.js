const express = require('express');
const http = require('http');
const socketIo = require('socket.io');
const mysql = require('mysql');
const mongoose = require('mongoose');
const { Schema } = mongoose;


const app = express();
const server = http.createServer(app);
const io = socketIo(server);

const PORT = process.env.PORT || 3000;

// MySQL connection configuration
const dbConfig = {
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'hospitaldata'
};

let clients = {};
// Create a MySQL connection
const connection = mysql.createConnection(dbConfig);

// Connect to MySQL
connection.connect((err) => {
    if (err) {
        console.error('Error connecting to MySQL:', err);
        return;
    }
    console.log('Connected to MySQL database');
});

// Establish MongoDB connection 
try {
    mongoose.connect('mongodb://localhost:27017/hospitalData');
    console.log('Connected to MongoDB');
} catch (error) {
    console.error('Error connecting to MongoDB:', error);
}

// Define a schema for hospital-related data
const hospitalSchema = new Schema({
    patientName: String,
    patientAge: Number,
    diagnosis: String,
    treatment: String,
    admissionDate: Date,
    dischargeDate: Date
}, { collection: 'datas' }); // Specify the collection name here

// Create a Mongoose model for hospital data
const HospitalRecord = mongoose.model('HospitalRecord', hospitalSchema);

const uploadData = new Schema({
    patientName: String,
    patientAge: Number,
    diagnosis: String,
    treatment: String,
    admissionDate: Date,
    dischargeDate: Date
}, { collection: 'uploadData' }); // Specify the collection name here


const uploadRecord = mongoose.model('uploadRecord', uploadData);

// Event listener for new connections
io.on('connection', (socket) => {
    console.log('Client connected:', socket.id);
    clients[socket.id] = {
        id: socket.id,
        ip: socket.request.connection.remoteAddress,
    };
    updateClients();

    // Listen for disconnections
    socket.on('disconnect', () => {
        console.log('Client disconnected:', socket.id);
        delete clients[socket.id];
        updateClients();
    });

    // Listen for synchronization button click
    socket.on('syncData', () => {
        console.log('Inside syncData event listener'); // This line should be printed
        // Query to fetch data from MySQL
        const query = 'SELECT * FROM data';

        // Execute the query
        connection.query(query, (err, results) => {
            if (err) {
                console.error('Error retrieving data from MySQL:', err);
                return;
            }
            const startTime = Date.now();
            // Extract data from results
            const data = results.map(row => ({
                id:row.id,
                patientName: row.patientName,
                patientAge: row.patientAge,
                diagnosis: row.diagnosis,
                treatment: row.treatment,
                admissionDate: row.admissionDate,
                dischargeDate: row.dischargeDate
            }));
            // Emit data to all clients
            //console.log('Synchronization data:', data);
            io.emit('syncData', data);
            const endTime = Date.now();
            const syncTime = endTime - startTime;
            console.log('Synchronization time from MySql:', syncTime, 'ms');

            // Calculate synchronization speed
            const dataSize = JSON.stringify(data).length; // Calculate data size in bytes
            const syncSpeed = dataSize / (syncTime / 1000); // Calculate speed in bytes per second

            // Send synchronization time and speed back to the host
            io.to(socket.id).emit('syncSpeed',  syncSpeed );
            // Send synchronization time back to the host
            io.to(socket.id).emit('syncTime', syncTime);
            io.to(socket.id).emit('dataSize', dataSize);
            io.to(socket.id).emit('startTime',  startTime);
            io.to(socket.id).emit('endTime',  endTime);
        });
    });



    // Event listener for 'syncDataMongo' event
    socket.on('syncDataMongo', () => {
        console.log('Inside syncDataMongo event listener');
        
        // Check if the connection to MongoDB is established
        if (mongoose.connection.readyState !== 1) {
            console.error('Connection to MongoDB is not yet established');
            return;
        }
        
        HospitalRecord.find({})
    .then(documents => {
        const startTime = Date.now();
        // Extracting data from documents
        const data = documents.map(doc => ({
            patientName: doc.patientName,
            patientAge: doc.patientAge,
            diagnosis: doc.diagnosis,
            treatment: doc.treatment,
            admissionDate: doc.admissionDate,
            dischargeDate: doc.dischargeDate
        }));
       // console.log('Synchronization data (MongoDB):', data);
        io.emit('syncDataMongo', data);
        const endTime = Date.now();
        const syncTime = endTime - startTime;
        console.log('Synchronization time from MongoDB:', syncTime, 'ms');

        // Calculate synchronization speed
        const dataSize = JSON.stringify(data).length; // Calculate data size in bytes
        const syncSpeed = dataSize / (syncTime / 1000); // Calculate speed in bytes per second

        // Send synchronization time and speed back to the host
        io.to(socket.id).emit('syncSpeed', syncSpeed);
        io.to(socket.id).emit('syncTimeMongo', syncTime);
        io.to(socket.id).emit('dataSize', dataSize);
        io.to(socket.id).emit('startTime',  startTime);
        io.to(socket.id).emit('endTime',  endTime);
    })
    .catch(err => {
        console.error('Error retrieving data from MongoDB:', err);
    });
    });

    
    
// Event listener for fileData event
socket.on('fileData', function (fileData) {
    console.log('Received file data:', fileData);
    const startTime = Date.now();
    try {
        const jsonData = JSON.parse(fileData);

        // Check if jsonData is an array
        if (Array.isArray(jsonData)) {
            // Iterate over each document in the array
            jsonData.forEach(document => {
                // Save each document to the 'uploadData' collection in MongoDB
                const newRecord = new uploadRecord(document);
                newRecord.save()
                    .then(() => {
                        console.log('JSON document saved to MongoDB collection');
                        // Emit the saved JSON document to all clients
                    })
                    .catch(error => {
                        console.error('Error saving JSON document to MongoDB:', error);
                    });
            });
        } else {
            console.error('Invalid JSON data format: Expected an array');
        }
    } catch (error) {
        console.error('Error parsing JSON data:', error);
    }

    // Broadcast the file data to all clients
    
    io.emit('fileData', fileData);
    const endTime = Date.now();
    const syncTime = endTime - startTime;
    const dataSize = fileData.length; // Calculate data size in bytes
    const syncSpeed = dataSize / (syncTime / 1000);
    io.to(socket.id).emit('syncSpeed', syncSpeed);
    io.to(socket.id).emit('syncTime', syncTime);
    io.to(socket.id).emit('dataSize', dataSize);
    io.to(socket.id).emit('startTime',  startTime);
    io.to(socket.id).emit('endTime',  endTime);
});



    socket.on('message', (message) => {
        const startTime = Date.now();
        socket.broadcast.emit('message', message);
        const endTime = Date.now();
        const syncTime = endTime-startTime;

        const dataSize = message.length; // Calculate data size in bytes
        const syncSpeed = dataSize / (syncTime / 1000); 
        io.to(socket.id).emit('syncSpeed',  syncSpeed );
        io.to(socket.id).emit('syncTime', syncTime);
        io.to(socket.id).emit('dataSize', dataSize);
        io.to(socket.id).emit('syncInfo', { clients: Object.keys(clients).length });
        io.to(socket.id).emit('startTime',  startTime);
        io.to(socket.id).emit('endTime',  endTime);
    });

});


function updateClients() {
    const clientInfo = Object.values(clients);
    io.emit('clients', clientInfo); // Send client information including both ID and IP address
}
// Serve host.html for the host
app.get('/hostMysql', (req, res) => {
    res.sendFile(__dirname + '/templates/hostMysql.html');
});

app.get('/hostMongoDb', (req, res) => {
    res.sendFile(__dirname + '/templates/hostMongoDb.html');
});

app.get('/hostInput', (req, res) => {
    res.sendFile(__dirname + '/templates/hostinputText.html');
});

app.get('/hostUploadFile', (req, res) => {
    res.sendFile(__dirname + '/templates/hostUploadFile.html');
});



// Serve client.html for clients
app.get('/client', (req, res) => {
    res.sendFile(__dirname + '/templates/client.html');
});

// Start the server
server.listen(PORT, () => {
    console.log(`Server listening on port ${PORT}`);
});
