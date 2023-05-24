const { Router } = require('express');
const myContact = require('../controllers/contact.controller');

const ContactRoute = Router;

ContactRoute.get('/',myContact.getContact);

module.exports = ContactRoute;