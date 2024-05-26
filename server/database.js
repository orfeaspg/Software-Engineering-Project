const mysql = require('mysql');
const express = require('express');
const session = require('express-session');
const app = express();
const path = require('path');

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

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

//login
app.get('/login', (req, res) => {
    res.sendFile(path.join(__dirname, '../loginForm.html'));
});

app.use(session({
    secret: 'session_pass',
    resave: false,
    saveUninitialized: true,
    cookie: { secure: false }
}));

//login
app.post('/login', (req, res) => {
    const { username, password } = req.body;
    const query = "SELECT * FROM user WHERE username = ? AND password = ?";
    connection.query(query, [username, password], (err, results) => {
        if (err) {
            console.error(err);
            res.json({ status: 'error', message: 'Something went wrong.' });
        } else if (results.length > 0) {
            req.session.user = results[0];
            req.session.username = results[0].username;
            res.json({ status: 'success', redirectUrl: '/home' });
        } else {
            res.json({ status: 'error', message: 'Invalid username or password.' });
        }
    });
});

//forum
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

app.get('/home', (req, res) => {
    if (req.session.user) {
        res.sendFile(path.join(__dirname, '../FirstPage.html'));
    } else (res.sendFile(path.join(__dirname, '../loginForm.html')));
});


app.get('/get-username', (req, res) => {
    if (req.session.username) {
        res.json({ username: req.session.username });
    } else {
        res.json({ username: null });
    }
});