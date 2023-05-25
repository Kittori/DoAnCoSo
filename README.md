"# DoAnCoSo" 
var bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({ extended: false}));
app.use(bodyParser.json());

app.post('/register', (req,res,next) => {
    let acc_F_Name = req.body.acc_F_Name
    let acc_L_Name = req.body.acc_L_Name
    let acc_Account = req.body.acc_Account
    let acc_Password = req.body.acc_Password
    let acc_Email = req.body.acc_Email
    let acc_Birth = req.body.acc_Birth
    let acc_Phone = req.body.acc_Phone
    let acc_Role = req.body.acc_Role

    AccountModel.create({
        acc_F_Name   : acc_F_Name,
        acc_L_Name   : acc_L_Name,
        acc_Account  : acc_Account,
        acc_Password : acc_Password,
        acc_Email    : acc_Email,
        acc_Birth    : acc_Birth,
        acc_Phone    : acc_Phone,
        acc_Role     : acc_Role,
    })
    .then(data =>{
        res.json('Tao Tai Khoan Thanh Cong');
    })
    .catch(err =>{
        res.status(500).json('Tao Tai Khoan That Bai')
    })
})





RegisterRoute.post('/create', (req,res,next) => {
    let acc_F_Name = req.body.acc_F_Name
    let acc_L_Name = req.body.acc_L_Name
    let acc_Account = req.body.acc_Account
    let acc_Password = req.body.acc_Password
    let acc_Email = req.body.acc_Email
    let acc_Birth = req.body.acc_Birth
    let acc_Phone = req.body.acc_Phone
    let acc_Role = req.body.acc_Role

    AccountModel.create({
        acc_F_Name   : acc_F_Name,
        acc_L_Name   : acc_L_Name,
        acc_Account  : acc_Account,
        acc_Password : acc_Password,
        acc_Email    : acc_Email,
        acc_Birth    : acc_Birth,
        acc_Phone    : acc_Phone,
        acc_Role     : acc_Role,
    })
    if (data =>{
        res.json('Tao Tai Khoan Thanh Cong');
    })
        res.status(500).json('Tao Tai Khoan That Bai')
    })


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
