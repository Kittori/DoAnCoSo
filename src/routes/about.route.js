const { Router } = require('express');
const AboutUs = require('../controllers/about.controller');

const AboutRoute = Router();

AboutRoute.get('/',AboutUs.getAbout);

module.exports = AboutRoute;
