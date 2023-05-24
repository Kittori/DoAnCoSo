const { Request, Response, NextFunction } = require('express');
const LocationsModel = require('../models/location.model');
/**
 * 
 * @param {Request} req 
 * @param {Response} res 
 * @param {NextFunction} next 
 */
async function createLocations(req, res, next) {
    const result = await LocationsModel.create('Mui Ne','muine.jpg','Lorem Ipsum Dolor Sit Amet Consectetur Adipisicing Elit. Aperiam Voluptate Accusantium Repellat Aliquam Esse Odit Commodi Est Cumque Perferendis Rem Veritatis Minus Aliquid Delectus Eligendi.');
    return res.send(result);
}

/**
 * 
 * @param {Request} req 
 * @param {Response} res 
 * @param {NextFunction} next 
 */
async function getLocations(req, res, next) {
    const result = await LocationsModel.getAll();
    console.log(result);
    // res.render('locations', { locations: result.recordsets }) //handlebars
    return res.render('locations', { locations: result.recordset});
}

exports.createLocations = createLocations;
exports.getLocations = getLocations;

