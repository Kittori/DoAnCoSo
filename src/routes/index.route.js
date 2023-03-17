// Import Router from express
const { Router } = require('express');

// Import the index controller
const IndexController = require('../controllers/index.controller');
const AboutRouter = require('../routes/about.route');
const ToursRouter = require('./tours.route');
const DesRouter = require('./destinations.route');
const ContactRouter = require('./contact.route');

// Create a new router
const IndexRoute = Router();

// Set the index route
IndexRoute.get('/', IndexController.index);
IndexRoute.use('/about',AboutRouter);
IndexRoute.use('/tours',ToursRouter);
IndexRoute.use('/destinations',DesRouter);
IndexRoute.use('/contact',ContactRouter);

// Export the router
module.exports = IndexRoute;