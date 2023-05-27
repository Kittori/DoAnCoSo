const getConnection = require("../database/sql");

/**
 * create Booking
 * @param {string} bo_userName
 * @param {string} bo_userEmail
 * @param {number} acc_ID 
 * @param {number} tours_ID
 * @param {string} bo_userPhone
 * @param {string} bo_locaName
 * @param {string} bo_checkInDate
 * @param {number} bo_numberTourist
 * @param {string} bo_note
 */

async function create(bo_userName, bo_userEmail, acc_ID, tours_ID, bo_userPhone, bo_locaName, bo_checkInDate, bo_numberTourist, bo_note){
    const pool = await getConnection();
    if (pool) {
        try {
            const result = await pool.query(`
            INSERT INTO Booking (bo_userName, bo_userEmail, acc_ID, tours_ID, bo_userPhone, bo_locaName, bo_checkInDate, bo_numberTourist, bo_note)
            VALUES ('${bo_userName}','${bo_userEmail}','${acc_ID}','${tours_ID}','${bo_userPhone}','${bo_locaName}','${bo_checkInDate}','${bo_numberTourist}','${bo_note}');
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

exports.create = create;