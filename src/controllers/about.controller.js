const { Request, Response, NextFunction } = require('express');

/**
 * 
 * @param {Request} req 
 * @param {Response} res 
 * @param {NextFunction} next 
 */
function getAbout(req, res, next) {
    return res.render('about');
}

exports.getAbout = getAbout;