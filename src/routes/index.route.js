// Import Router from express
const { Router } = require('express');

// Import the index controller
const IndexController = require('../controllers/index.controller');
const AboutRouter = require('../routes/about.route');
const ToursRouter = require('./tours.route');
const ContactRouter = require('./contact.route');
const AccountRoute = require('./account.route');
const LocationsRoute = require('./locations.route');
const RegisterRoute = require('./register.route')

// Create a new router
const IndexRoute = Router();

// Set the index route
IndexRoute.use('/about',AboutRouter);
IndexRoute.use('/tours',ToursRouter);
IndexRoute.use('/contact',ContactRouter);
IndexRoute.use('/account',AccountRoute);
IndexRoute.use('/locations',LocationsRoute);
IndexRoute.use('/register',RegisterRoute);
IndexRoute.get('/', IndexController.index);

// Export the router
module.exports = IndexRoute;