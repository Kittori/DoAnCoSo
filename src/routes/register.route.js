const { Router } = require('express');
const register = require('../controllers/register.controller');
const AccountModel = require('../models/account.model');

const RegisterRoute = Router();

RegisterRoute.get('/',register.getRegister);

//them moi du lieu tu database
RegisterRoute.post('/create-new-account', async (req,res,next) => {
    const data = req.body;
    console.log(req.body);
    console.log(req.params);
    console.log(req.query);

    var acc_F_Name   = req.body.acc_F_Name;
    var acc_L_Name   = req.body.acc_L_Name;
    var acc_Account  = req.body.acc_Account;
    var acc_Password = req.body.acc_Password;
    var acc_Email    = req.body.acc_Email;
    var acc_Birth    = req.body.acc_Birth;
    var acc_Phone    = req.body.acc_Phone;

    return AccountModel.create(
        acc_F_Name   = acc_F_Name,
        acc_L_Name   = acc_L_Name,
        acc_Account  = acc_Account,
        acc_Password = acc_Password,
        acc_Email    = acc_Email,
        acc_Birth    = acc_Birth,
        acc_Phone    = acc_Phone
    )
    .then(data =>{
        res.redirect('/');
    })
    .catch(err =>{
        res.status(500).json('Tao Tai Khoan That Bai')
    })
})

module.exports = RegisterRoute;