const { Request, Response, NextFunction } = require('express');
const LocationsModel = require('../models/location.model');

/**
 * 
 * @param {Request} req 
 * @param {Response} res 
 * @param {NextFunction} next 
 */
async function showLocations(req, res, next) {
    // [GET] /course/:loca_Slug
        const result = await LocationsModel.findOne( loca_Slug = req.params.loca_Slug);
        console.log(result);
        return res.render('course/showLocations', {courseLocations : result.recordset});
}


// Export the index controller
exports.showLocations = showLocations;
