const express = require('express');
const mysql = require('mysql2/promise');
const routes = require('./routes/index');

// Create MySQL connection pool
const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'dnd',
    connectionLimit: 10, // Adjust the limit as per requirements
});

// Utility function to execute a MySQL query
const executeQuery = async (query) => {
    try {
      const connection = await pool.getConnection();
      const [results] = await connection.query(query);
      connection.release();
      return results;
    } catch (error) {
      throw new Error('Error executing MySQL query');
    }
  };

// Create express app
const app = express();

// Middleware to handle errors
app.use((err, req, res, next) => {
    console.error('Error:', err);
    res.status(500).json({ error: 'Internal server error' });
});

// Races endpoint
app.get('/races', async (req, res) => {
    try {
        const query = 'SELECT * FROM races';
        const results = await executeQuery(query);
        res.json(results);
    } catch (error) {
        console.log(error);
        res.status(400).send({error: 'Bad Request'});
    }
});

// List gender endpoint
app.get('/gender', async (req, res) => {
    try {
        const query = 'SELECT name, description FROM gender';
        const results = await executeQuery(query);
        res.json(results);        
    } catch (error) {
        res.status(400).send({error: 'Bad Request'});
    }
});

// List classes endpoint
app.get('/classes', async (req, res) => {
    try {
        const query = 'SELECT name, hit_die, spellcasting FROM classes';
        const results = await executeQuery(query);
        res.json(results);
    } catch (error) {
        res.status(400).send({error: 'Bad Request'});
    }
})

// Start the server
app.listen(3000, () => {
    console.log('Server started on port 3000');
});