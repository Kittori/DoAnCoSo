const getConnection = require("../database/sql");

/**
 * create Locations
 * @param {string} loca_Name
 * @param {string} loca_Image  
 * @param {string} loca_Description
 */

async function create(loca_Name,loca_Image,loca_Description){
    const pool = await getConnection();
    if (pool) {
        try {
            const result = await pool.query(`
            INSERT INTO Locations (loca_Name,loca_Image,loca_Description) 
            VALUES ('${loca_Name}', '${loca_Image}', '${loca_Description}');
            `);
            pool.close();
            return result;
        } catch {err} {
            console.log(err);
            pool.close();
        return null;
        }
    }
        return null;
}

/**
 * Get All Accounts
 */
async function getAll(){
    const pool = await getConnection();
    if (pool) {
        try {
            const result = await pool.query(`
            select * from Locations
            `);
            pool.close();
            return result;
        } catch {err} {
            console.log(err);
            pool.close();
        return null;
        }
    }
        return null;
}

exports.create = create;
exports.getAll = getAll;

