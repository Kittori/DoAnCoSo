const getConnection = require('../sql');

(async () => {
    const pool = await getConnection();
    if (pool) {
        console.log("Connected to database");
        const result = await pool.query(
            `select * from Account;`
        );
        console.log(result);
        pool.close();
    } else {
        console.log("Failed to connect to database");
    }
})()