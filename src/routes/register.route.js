const { Router } = require('express');
const register = require('../controllers/register.controller');
const AccountModel = require('../models/account.model');

const RegisterRoute = Router;

RegisterRoute.get('/',register.getRegister);

//them moi du lieu tu database
RegisterRoute.post('/create', (req,res,next) => {
        let acc_F_Name = req.body.acc_F_Name;
        let acc_L_Name = req.body.acc_L_Name;
        let acc_Account = req.body.acc_Account;
        let acc_Password = req.body.acc_Password;
        let acc_Email = req.body.acc_Email;
        let acc_Birth = req.body.acc_Birth;
        let acc_Phone = req.body.acc_Phone;
        let acc_Role = req.body.acc_Role;
    
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
        if (data=>{
            res.json('Tao Tai Khoan Thanh Cong');
        })
            res.status(500).json('Tao Tai Khoan Khong Thanh Cong');
    })()  

module.exports = RegisterRoute;