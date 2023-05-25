// Import Router from express
const { Router } = require('express');
const AccountController = require('../controllers/account.controller');

const AccountRoute = Router();

AccountRoute.get('/create', AccountController.createAccount);
AccountRoute.get('/get-all', AccountController.getAccounts);

module.exports= AccountRoute;