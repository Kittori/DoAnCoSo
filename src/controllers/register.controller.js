const { Request, Response, NextFunction } = require('express');
const AccountModel = require('../models/account.model');
/**
 * 
 * @param {Request} req 
 * @param {Response} res 
 * @param {NextFunction} next 
 */
function getRegister(req, res, next) {
    return res.render('register');
}

exports.getRegister = getRegister;
