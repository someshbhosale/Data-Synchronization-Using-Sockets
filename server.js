const express = require('express');
const http = require('http');
const socketIo = require('socket.io');
//const mysql = require('mysql');
const mongoose = require('mongoose');
const { Schema } = mongoose;


const app = express();
const server = http.createServer(app);
const io = socketIo(server);

const PORT = process.env.PORT || 3000;

// MySQL connection configuration
// const dbConfig = {
//     host: 'localhost',
//     user: 'root',
//     password: '',
//     database: 'hospitaldata'
// };

// MongoDB connection configuration
const mongoConfig = {
    url: 'mongodb://localhost:27017',
    dbName: 'hospitalData',
    collectionName: 'datas'
};

let clients = {};
// Create a MySQL connection
//const connection = mysql.createConnection(dbConfig);

// Connect to MySQL
// connection.connect((err) => {
//     if (err) {
//         console.error('Error connecting to MySQL:', err);
//         return;
//     }
//     console.log('Connected to MySQL database');
// });

// Establish MongoDB connection 
try {
    mongoose.connect('mongodb+srv://someshbhosale2:somesh@cluster0.atanct9.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0');
    console.log('Connected to MongoDB');
} catch (error) {
    console.error('Error connecting to MongoDB:', error);
}

const messageSchema = new Schema({
    message: String
}, { collection: 'datas' }); // Specify the collection name here

// Create a Mongoose model
const Message = mongoose.model('Message', messageSchema);

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
    // socket.on('syncData', () => {
    //     console.log('Inside syncData event listener'); // This line should be printed
    //     // Query to fetch data from MySQL
    //     const query = 'SELECT * FROM data';

    //     // Execute the query
    //     connection.query(query, (err, results) => {
    //         if (err) {
    //             console.error('Error retrieving data from MySQL:', err);
    //             return;
    //         }
    //         const startTime = Date.now();
    //         // Extract data from results
    //         const data = results.map(row => row.message);
    //         // Emit data to all clients
    //         console.log('Synchronization data:', data);
    //         io.emit('syncData', data);
    //         const endTime = Date.now();
    //         const syncTime = endTime - startTime;
    //         console.log('Synchronization time from MySql:', syncTime, 'ms');

    //         // Send synchronization time back to the host
    //         io.to(socket.id).emit('syncTime', syncTime);
    //     });
    // });



    // Event listener for 'syncDataMongo' event
    socket.on('syncDataMongo', () => {
        console.log('Inside syncDataMongo event listener');
        
        // Check if the connection to MongoDB is established
        if (mongoose.connection.readyState !== 1) {
            console.error('Connection to MongoDB is not yet established');
            return;
        }
        
        // Find all documents in the collection and emit data to clients
        Message.find({})
            .then(documents => {
                const startTime = Date.now();
                const data = documents.map(doc => doc.message);
                console.log('Synchronization data (MongoDB):', data);
                io.emit('syncDataMongo', data);
                const endTime = Date.now();
                const syncTime = endTime - startTime;
                console.log('Synchronization time from MongoDB:', syncTime, 'ms');
                io.to(socket.id).emit('syncTimeMongo', syncTime);
            })
            .catch(err => {
                console.error('Error retrieving data from MongoDB:', err);
            });
    });

    








});


function updateClients() {
    const clientInfo = Object.values(clients);
    io.emit('clients', clientInfo); // Send client information including both ID and IP address
}
// Serve host.html for the host
app.get('/hostMysql', (req, res) => {
    res.sendFile(__dirname + '/hostMysql.html');
});

app.get('/hostMongoDb', (req, res) => {
    res.sendFile(__dirname + '/hostMongoDb.html');
});

// Serve client.html for clients
app.get('/clientMysql', (req, res) => {
    res.sendFile(__dirname + '/clientMysql.html');
});

// Serve client.html for clients
app.get('/clientMongoDb', (req, res) => {
    res.sendFile(__dirname + '/clientMongoDb.html');
});

// Start the server
server.listen(PORT, () => {
    console.log(`Server listening on port ${PORT}`);
});
