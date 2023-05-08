const sql = require('mssql');
const SqlConfig = require('./config');

async function getConnection() {
    try{
        const pool = await sql.connect(SqlConfig);
        return pool;
    } catch(err) {
        console.log(err);
        return null;
    }
}
module.exports = getConnection;