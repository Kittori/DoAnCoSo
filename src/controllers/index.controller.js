// Import the express module
const { Request, Response, NextFunction } = require('express');

/**
 * 
 * @param {Request} req 
 * @param {Response} res 
 * @param {NextFunction} next 
 */
function index(req, res, next) {
    return res.render('index');
}
// Export the index controller
exports.index = index;