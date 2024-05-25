const express = require('express');
const app = express();
const connection = require('./database.js');

app.get('/api/data', (req, res) => {
    connection.query('SELECT * FROM `articles` ORDER BY `id` ASC LIMIT 1', (error, results) => {
        if (error) {
            return res.json({ error: error });
        }
        res.json(results);
    });
});

app.listen(3000, () => console.log('Server running on port 3000'));

app.get('/', (req, res) => {
    res.send('Hello, world!');
});