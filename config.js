const { Client } = require('pg');

const client = new Client({
    host: 'localhost',
    port: 5432,
    user: "postgres",
    password: "681379",
    database: "postgres",

});

module.exports = client;

// client.connect((err)=>{
//     if (err){
//         console.log(err.message);
//         return;
//     }
//     console.log("Database connected")
// })

// client.query('SELECT * from Books', (err,res)=>{
//     console.log(err,res)
//     client.end()
// })
