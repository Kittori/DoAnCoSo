// Import Router from express
const { Router } = require('express');

// Import the index controller
const IndexController = require('../controllers/index.controller');
const AboutRouter = require('../routes/about.route');
const ToursRouter = require('./tours.route');
const ContactRouter = require('./contact.route');
const AccountRoute = require('./account.route');
const LocationsRoute = require('./locations.route');
const Course_L_Route = require('./courseLocations.route');
const Course_T_Route = require('./courseTourse.route');
const RegisterRoute = require('./register.route');
const BookingRouter = require('../routes/booking.route');

// Create a new router
const IndexRoute = Router();

// Set the index route
IndexRoute.use('/about',AboutRouter);
IndexRoute.use('/tours',ToursRouter);
IndexRoute.use('/contact',ContactRouter);
IndexRoute.use('/account',AccountRoute);
IndexRoute.use('/locations',LocationsRoute);
IndexRoute.use('/register',RegisterRoute);
IndexRoute.use('/course_L',Course_L_Route);
IndexRoute.use('/course_T',Course_T_Route);
IndexRoute.use('/booking',BookingRouter);
IndexRoute.get('/', IndexController.index);

// Export the router
module.exports = IndexRoute;