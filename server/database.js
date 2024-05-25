const mysql = require('mysql');
const express = require('express');
const app = express();
const path = require('path');

app.use(express.static(path.join(__dirname, '../')));


require('dotenv').config(); // Load environment variables from .env file

const connection = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME
});

connection.connect((err) => {
    if (err) {
        console.error('Error connecting: ' + err.stack);
        return;
    }
    console.log('Connected as id ' + connection.threadId);
});

module.exports = connection;

app.listen(3000, () => console.log('Server running on port 3000'));

app.get('/login', (req, res) => {
    res.sendFile(path.join(__dirname, '../loginForm.html'));
});

app.get('/forum', (req, res) => {
    const query = "SELECT * FROM `articles` ORDER BY `id` ASC LIMIT 1;"; // Replace with your SQL query

    connection.query(query, (err, results) => {
        if (err) {
            console.error(err);
            res.status(500).send('Server error');
        } else {
            console.log(results);
            res.sendFile(path.join(__dirname, '../forums.html'));
        }
    });
});