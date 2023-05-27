const { Request, Response, NextFunction } = require('express');
const ToursModel = require('../models/tours.model');

/**
 * 
 * @param {Request} req 
 * @param {Response} res 
 * @param {NextFunction} next 
 */
async function getTours(req, res, next) {
    const result = await ToursModel.getAll();
    console.log(result);
    // res.render('locations', { locations: result.recordsets }) //handlebars
    return res.render('tours', { tours: result.recordset});
}

/**
 * 
 * @param {Request} req 
 * @param {Response} res 
 * @param {NextFunction} next 
 */
async function showTours(req, res, next) {
    // [GET] /course/:tours_Slug
        const result = await ToursModel.findOne( tours_Slug = req.params.tours_Slug);
        console.log(result);
        return res.render('course/showTours', {courseTours : result.recordset});
}

exports.getTours = getTours;
exports.showTours = showTours;