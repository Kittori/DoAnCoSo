const { Router } = require('express');
const LocationsController = require('../controllers/locations.controller');

const LocationsRoute = Router;

LocationsRoute.get('/create', LocationsController.createLocations);
LocationsRoute.get('/', LocationsController.getLocations);


module.exports= LocationsRoute;