const { Router } = require('express');
const CourseController = require('../controllers/courseLocations.controller');

const CourseRoute = Router();

CourseRoute.get('/:loca_Slug',CourseController.showLocations);



module.exports= CourseRoute;