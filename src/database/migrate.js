function migrate() {
    require('./migrations/230408_2015_createAccount');
    require('./migrations/230522_1420_createTour');
    require('./migrations/230522_1423_createLocation');
    require('./migrations/230522_1424_createBooking');
    require('./migrations/230522_1425_createBookDetail');
}

migrate();