const { Router } = require('express');
const Course_T_Controller = require('../controllers/courseTours.controller');

const Course_T_Route = Router();

Course_T_Route.get('/:tours_Slug',Course_T_Controller.showTours);



module.exports= Course_T_Route;