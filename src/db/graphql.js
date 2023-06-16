const { buildSchema } = require('graphql');

// Define the GraphQL schema
exports.schema = buildSchema (`
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