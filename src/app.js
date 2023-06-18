const express = require('express');
const { graphqlHTTP } = require('express-graphql');
const mysql = require('mysql2/promise');
const { schema } = require('./db/graphql');
const cors = require('cors');

// Create MySQL connection pool
const pool = mysql.createPool({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DATABASE,
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

// Define the root resolver
const root = {
    races: async () => {
        const query = 'SELECT * FROM races';
        const results = await executeQuery(query);
        return results;
    },
    gender: async () => {
        const query = 'SELECT name, description FROM gender';
        const results = await executeQuery(query);
        return results;
    },
    classes: async () => {
        const query = 'SELECT name, hit_die, spellcasting FROM classes';
        const results = await executeQuery(query);
        return results;
    },
};

// Create express app
const app = express();

// Enable CORS
app.use(cors());

// GraphQL endpoint
app.use('/graphql', graphqlHTTP({
    schema: schema,
    rootValue: root,
    graphiql: true,
}));

// Start the server
app.listen(3000, () => {
    console.log('Server started on port 3000');
});
