const { Router } = require('express');
const myDestinations = require('../controllers/destinations.controller');

const DesRoute = Router();

DesRoute.get('/',myDestinations.getDes);

module.exports = DesRoute;
