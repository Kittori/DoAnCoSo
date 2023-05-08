const getConnection = require('../sql');

(async () => {
    const pool = await getConnection();
    if (pool) {
        console.log("Connected to database");
        const result = await pool.query(
            `create table Account(
                acc_ID int identity(1,1),
                acc_F_Name varchar(100) not null,
                acc_L_Name varchar(10) not null,
                acc_Account varchar(50) not null,
                acc_Password varchar(50) not null,
                acc_Email varchar(50) unique,
                acc_Birth datetime,
                acc_Phone varchar(10),
                acc_Gender char(1),
                acc_Role char(1),
                constraint Pk_Account_ID primary key(acc_ID)
            );`
        );
        console.log(result);
        pool.close();
    } else {
        console.log("Failed to connect to database");
    }
})()