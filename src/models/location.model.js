const getConnection = require("../database/sql");

/**
 * create Locations
 * @param {string} loca_Name
 * @param {string} loca_Image  
 * @param {string} loca_Description
 * @param {string} loca_Slug
 */

async function create(loca_Name,loca_Image,loca_Description,loca_Slug){
    const pool = await getConnection();
    if (pool) {
        try {
            const result = await pool.query(`
            INSERT INTO Locations (loca_Name,loca_Image,loca_Description,loca_Slug) 
            VALUES ('${loca_Name}', '${loca_Image}', '${loca_Description}',${loca_Slug});
            `);
            pool.close();
            return result;
        } catch (err) {
            console.log(err);
            pool.close();
        return null;
        }
    }
        return null;
}

/**
 * Get All locations
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
        } catch (err) {
            console.log(err);
            pool.close();
        return null;
        }
    }
        return null;
}

/**
 * Find Locations
 */
async function findOne(loca_Slug){
    const pool = await getConnection();
    if (pool) {
        try {
            const result = await pool.query(`select * from Locations where loca_Slug = '${loca_Slug}';`);
            pool.close();
            return result;
        } catch (err) {
            console.log(err);
            pool.close();
        return null;
        }
    }
        return null;
}


exports.create = create;
exports.getAll = getAll;
exports.findOne = findOne;
