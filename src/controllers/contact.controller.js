const { Request, Response, NextFunction } = require('express');

/**
 * 
 * @param {Request} req 
 * @param {Response} res 
 * @param {NextFunction} next 
 */
function getContact(req, res, next) {
    return res.render('contact');
}

exports.getContact = getContact;