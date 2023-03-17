const { Request, Response, NextFunction } = require('express');

/**
 * 
 * @param {Request} req 
 * @param {Response} res 
 * @param {NextFunction} next 
 */
function getTours(req, res, next) {
    return res.render('tours');
}

exports.getTours = getTours;