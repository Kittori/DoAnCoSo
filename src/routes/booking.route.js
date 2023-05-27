const { Router } = require('express');
const BookingTour = require('../controllers/booking.controller');
const BookingModel = require('../models/booking.model');

const BookingRoute = Router();

BookingRoute.get('/',BookingTour.getBookingTours);

BookingRoute.post('/booking-new-tours', async (req,res,next) => {
    const data = req.body;
    console.log(req.body);
    console.log(req.params);
    console.log(req.query);

    var bo_userName      = req.body.bo_userName;
    var bo_userEmail     = req.body.bo_userEmail;
    var acc_ID           = req.body.acc_ID;
    var tours_ID         = req.body.tours_ID;
    var bo_userPhone     = req.body.bo_userPhone;
    var bo_locaName      = req.body.bo_locaName;
    var bo_checkInDate   = req.body.bo_checkInDate;
    var bo_numberTourist = req.body.bo_numberTourist;
    var bo_note          = req.body.bo_note;
    

    return BookingModel.create(
        bo_userName      = bo_userName,
        bo_userEmail     = bo_userEmail,
        acc_ID           = acc_ID,
        tours_ID         = tours_ID,
        bo_userPhone     = bo_userPhone,
        bo_locaName      = bo_locaName,
        bo_checkInDate   = bo_checkInDate,
        bo_numberTourist = bo_numberTourist,
        bo_note          = bo_note
    )
    .then(data =>{
        res.redirect('/');
    })
    .catch(err =>{
        res.status(500).json('Tao Tai Khoan That Bai')
    })
})


module.exports = BookingRoute;