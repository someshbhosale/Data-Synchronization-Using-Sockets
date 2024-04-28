const mongoose = require('mongoose');

// MongoDB connection setup
async function connect() {
    try {
        await mongoose.connect('mongodb://localhost:27017/synchronisation', {
            useNewUrlParser: true,
            useUnifiedTopology: true
        });
        console.log('Connected to MongoDB');
    } catch (error) {
        console.error('Error connecting to MongoDB:', error);
        throw error;
    }
}

// MongoDB schema and model
const DataModel = mongoose.model('hospitalData', {
    message: String
});

// Function to insert data into the MongoDB collection
async function insertData(message) {
    try {
        const newData = new DataModel({ message });
        const savedData = await newData.save();
        console.log('Data saved successfully:', savedData);
        return savedData;
    } catch (error) {
        console.error('Error saving data:', error);
        throw error;
    }
}

// Main function to insert data
async function main() {
    await connect();
    // Insert your data here
    await insertData("This is a sample message somesh");
    // You can insert more data if needed
    mongoose.disconnect();
}

// Call the main function
main().catch(error => {
    console.error('An error occurred:', error);
});
