const { Router } = require('express');
const myTours = require('../controllers/tours.controller');

const ToursRoute = Router();

ToursRoute.get('/', myTours.getTours);
ToursRoute.get('/:tours_Slug',myTours.showTours);

module.exports = ToursRoute;