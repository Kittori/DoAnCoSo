const { Request, Response, NextFunction } = require('express');

/**
 * 
 * @param {Request} req 
 * @param {Response} res 
 * @param {NextFunction} next 
 */
function getDes(req, res, next) {
    return res.render('destinations');
}

exports.getDes = getDes;