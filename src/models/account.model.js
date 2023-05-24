const getConnection = require("../database/sql");

/**
 * Create Acount 
 * @param {string} acc_F_Name
 * @param {string} acc_L_Name
 * @param {string} acc_Account
 * @param {string} acc_Password
 * @param {string} acc_Email
 * @param {Datetime} acc_Birth
 * @param {string} acc_Phone
 * @param {char} acc_Gender
 * @param {char} acc_Role
 */

async function create(acc_F_Name,acc_L_Name,acc_Account,acc_Password,acc_Email,acc_Birth,acc_Phone,acc_Gender,acc_Role){
    const pool = await getConnection();
    if (pool) {
        try {
            const result = await pool.query(`
            INSERT INTO Account (acc_F_Name,acc_L_Name,acc_Account,acc_Password,acc_Email,acc_Birth,acc_Phone,acc_Gender,acc_Role) 
            VALUES ('${acc_F_Name}', '${acc_L_Name}', '${acc_Account}', '${acc_Password}', '${acc_Email}', '${acc_Birth}', '${acc_Phone}', '${acc_Gender}', '${acc_Role}');
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
            select * from Account
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