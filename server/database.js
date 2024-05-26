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
            if(results[0].role_id === 2){
                res.json({ status: 'success', redirectUrl: '/admin' });
            } else res.json({ status: 'success', redirectUrl: '/home' });
        } else {
            res.json({ status: 'error', message: 'Invalid username or password.' });
        }
    });
});

//pages
app.get('/forum', (req, res) => {
    if (req.session.user) {
        res.sendFile(path.join(__dirname, '../forums.html'));
    }else (res.redirect("/login"));
});

//forum articles query
app.get('/forum-articles', (req, res) => {
    const query = "SELECT * FROM `articles` ORDER BY `id` ASC LIMIT 5;";
    connection.query(query, (err, results) => {
        if (err) {
            console.error(err);
            res.status(500).send('Server error');
        } else {
            res.json(results);
        }
    });
});
//forum posts query
app.get('/forum-posts', (req, res) => {
    const query = "SELECT * FROM `posts` INNER JOIN `user` ON `posts`.`user_id` = `user`.`id` ORDER BY `posts`.`id` DESC LIMIT 5;";
    connection.query(query, (err, results) => {
        if (err) {
            console.error(err);
            res.status(500).send('Server error');
        } else {
            res.json(results);
        }
    });
});

app.get('/home', (req, res) => {
    if (req.session.user) {
        res.sendFile(path.join(__dirname, '../FirstPage.html'));
    }else (res.redirect("/login"));
});


//external links query
app.get('/external-links', (req, res) => {
    const query = "SELECT * FROM `external_links` ORDER BY `id` ASC LIMIT 3;";
    connection.query(query, (err, results) => {
        if (err) {
            console.error(err);
            res.status(500).send('Server error');
        } else {
            res.json(results);
        }
    });
});

app.get('/chat', (req, res) => {
    if (req.session.user) {
        res.sendFile(path.join(__dirname, '../chat-room-selection.html'));
    } else (res.redirect("/login"));
});

app.get('/diary', (req, res) => {
    if (req.session.user) {
        res.sendFile(path.join(__dirname, '../personal-diary.html'));
    } else (res.redirect("/login"));
});

app.get('/streaks', (req, res) => {
    if (req.session.user) {
        res.sendFile(path.join(__dirname, '../streaks.html'));
    } else (res.redirect("/login"));
});

app.get('/profile', (req, res) => {
    if (req.session.user) {
        res.sendFile(path.join(__dirname, '../user_profile.html'));
    } else (res.redirect("/login"));
});

//profile posts query
app.get('/profile-posts', (req, res) => {
    const userId = req.session.user.id; // Assuming the user id is stored in req.session.user.id
    const query = "SELECT * FROM `posts` INNER JOIN `user` ON `posts`.`user_id` = `user`.`id` WHERE `posts`.`user_id` = ?;";
    connection.query(query, [userId], (err, results) => {
        if (err) {
            console.error(err);
            res.status(500).send('Server error');
        } else {
            res.json(results);
        }
    });
});


app.get('/contact_us', (req, res) => {
    if (req.session.user) {
        res.sendFile(path.join(__dirname, '../contactForm.html'));
    } else (res.redirect("/login"));
});

app.get('/admin', (req, res) => {
    if (req.session.user && req.session.user.role_id === 2) {
        res.sendFile(path.join(__dirname, '../admin.html'));
    } else (res.redirect("/login"));
});

//set username on the menu
app.get('/get-username', (req, res) => {
    if (req.session.username) {
        res.json({ username: req.session.username, name: req.session.user.name, surname: req.session.user.surname });
    } else {
        res.json({ username: null });
    }
});

//logout
app.post('/logout', async (req, res) => {
    req.session.destroy((err) => {
        if(err) {
            res.json({ status: 'error', message: 'Something went wrong.'});
        }
    })
    res.json({ status: 'success', redirectUrl: '/login' });
});

//admin exclusive pages
app.get('/get-role', (req, res) => {
    if (req.session.user) {
        res.json({ role_id: req.session.user.role_id });
    } else {
        res.json({ role_id: null });
    }
});