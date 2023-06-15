const express = require('express');
const { graphqlHTTP } = require('express-graphql');
const { buildSchema } = require('graphql');
const mysql = require('mysql2/promise');
const cors = require('cors');

// Create MySQL connection pool
const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'dnd',
    connectionLimit: 10, // Adjust the limit as per requirements
});

// Define the GraphQL schema
const schema = buildSchema(`
  type Race {
    id: Int
    name: String
    size: String
    speed: Int
    ability_bonuses: String
    alignment: String
    languages: String
    traits: String
  }

  type Gender {
    name: String
    description: String
  }

  type Class {
    name: String
    hit_die: Int
    spellcasting: String
  }

  type Query {
    races: [Race]
    gender: [Gender]
    classes: [Class]
  }
`);

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
