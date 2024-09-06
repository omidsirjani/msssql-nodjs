const sql = require('mssql')
require('dotenv').config();

const sqlConfig = {
    user: process.env.DB_USER,
    password: process.env.DB_PWD,
    database: process.env.DB_NAME,
    server: 'localhost',
    options: {
      encrypt: false, // for azure
      trustServerCertificate: true // change to true for local dev / self-signed certs
    }
  }

const poolPromise = new sql.ConnectionPool(sqlConfig).connect().then(
    pool =>{
        console.log('connected to pool')
        return pool
    }
).catch(err=>console.log('Error :' + err))

module.exports = {
    sql,
    poolPromise
}