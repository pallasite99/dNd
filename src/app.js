const express = require('express');
const mysql = require('mysql2');
const routes = require('./routes/index');

// Create MySQL connection
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'dnd',
});

// Connect to MySQL
connection.connect((err) => {
    if (err) {
      console.error('Error connecting to MySQL:', err);
      return;
    }
    console.log('Connected to MySQL');
});

// Create express app
const app = express();

// Races endpoint
app.get('/races', async (req, res, next) => {
    try {
        const query = 'SELECT * FROM races';

        connection.query(query, (err, results) => {
            if (err) {
                console.error('Error executing MySQL query:', err);
                res.status(500).json({ error: 'Internal server error' });
                return;
            }

            res.json(results);
        });
    } catch (error) {
        res.status(400).send({error: 'Bad Request'});
    }
});

// Start the server
app.listen(3000, () => {
    console.log('Server started on port 3000');
});