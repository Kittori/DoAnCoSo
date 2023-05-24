// Import the express module
const express = require('express');

// Import the handlebars module
const handlebars = require('express-handlebars');

// Import index router
const IndexRouter = require('./routes/index.route');
const getConnection = require('./database/sql');
const bodyParser = require('body-parser');
const AccountModel = require('./models/account.model');

// Create a new express application instance
const app = express();

// Set handlebars as the view engine
app.engine('handlebars', handlebars.engine());
app.set('view engine', 'handlebars');
app.set('views', __dirname + '/views');

// Set main route for the application
app.use(IndexRouter);

//Set static folder
app.use('/assets',express.static(__dirname + '/../assets'));

//Set body parsing
app.use(bodyParser.urlencoded({ extended: false}));
app.use(bodyParser.json());

(async () =>{
    const pool = await getConnection();
if(pool) {
    console.log('connected to database');
    pool.close();
    // Start the server
    app.listen(4000, () => {
    console.log('Server started on port 4000');
    });
} else {
    console.log('Failed to connect to database');
}
})()

