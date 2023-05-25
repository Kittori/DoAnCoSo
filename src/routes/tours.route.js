const { Router } = require('express');
const myTours = require('../controllers/tours.controller');

const ToursRoute = Router();

ToursRoute.get('/', myTours.getTours);

module.exports = ToursRoute;