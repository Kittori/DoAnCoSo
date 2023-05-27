const getConnection = require("../database/sql");

/**
 * create Locations
 * @param {string} tours_Name
 * @param {number} loca_ID
 * @param {string} tours_Date
 * @param {string} tours_Day
 * @param {string} tours_Price
 * @param {string} tours_Image_1
 * @param {string} tours_Image_2
 * @param {string} tours_Image_3
 * @param {string} tours_Image_4
 * @param {string} tours_Slug
 * @param {string} tours_Description
 */

async function create(tours_Name, loca_ID, tours_Date, tours_Day, tours_Price, tours_Image_1, tours_Image_2, tours_Image_3, tours_Image_4, tours_Slug, tours_Description){
    const pool = await getConnection();
    if (pool) {
        try {
            const result = await pool.query(`
            INSERT INTO Tours (tours_Name, loca_ID, tours_Date, tours_Day, tours_Price, tours_Image_1, tours_Image_2, tours_Image_3 ,tours_Image_4, tours_Slug, tours_Description)
            VALUES ('${tours_Name}','${loca_ID}','${tours_Date}','${tours_Day}','${tours_Price}','${tours_Image_1}','${tours_Image_2}','${tours_Image_3}','${tours_Image_4}','${tours_Slug}','${tours_Description}')`);
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
 * Get All Tours
 */
async function getAll(){
    const pool = await getConnection();
    if (pool) {
        try {
            const result = await pool.query(`select * from Tours`);
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
 * Find Tours
 */
async function findOne(tours_Slug){
    const pool = await getConnection();
    if (pool) {
        try {
            const result = await pool.query(`select * from Tours where tours_Slug = '${tours_Slug}';`);
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
 * Find Tours
 */
async function findID(tours_Slug){
    const pool = await getConnection();
    if (pool) {
        try {
            const result = await pool.query(`select tours_ID from Tours where tours_Name = '${tours_Name}';`);
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
exports.findID = findID;