const { Request, Response, NextFunction } = require('express');
const ToursModel = require('../models/tours.model');
const BookingModel = require('../models/booking.model');

/**
 * 
 * @param {Request} req 
 * @param {Response} res 
 * @param {NextFunction} next 
 */
async function getBookingTours(req, res, next) {
    const result = await ToursModel.getAll();
    console.log(result);
    // res.render('locations', { locations: result.recordsets }) //handlebars
    return res.render('booking', { booking: result.recordset});
}


exports.getBookingTours = getBookingTours;