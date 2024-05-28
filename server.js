const express = require('express');
const app = express();
const http = require('http');
const server = http.createServer(app);
const logger = require('morgan');
const cors = require('cors');
const passport = require('passport');
const multer = require('multer');
const serviceAccount = require('./serviceAccountKey.json');
const admin = require('firebase-admin');
var expressSession = require("express-session");
 
app.use(expressSession({
    secret: "This is one hell of a secret",
    resave: false,
    saveUninitialized: false
  }));
admin.initializeApp({
    credential: admin.credential.cert(serviceAccount)
});
const upload = multer({
    storage: multer.memoryStorage()
});
/*rutas*/
const users = require('./routes/usersRoutes');
const categories = require('./routes/categoriesRoutes');
const products = require('./routes/productsRoutes');
const address = require('./routes/addressRoutes');
const orders = require('./routes/ordersRoutes');




const port = process.env.PORT || 3000;

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({
    extended: true
}));

app.use(cors());
app.use(passport.initialize());
app.use(passport.session());

require('./config/passport')(passport);

app.disable('x-powered-by');

app.set('port', port);
//LLAMANDO A LAS RUTAS
users(app, upload);
categories(app, upload);
address(app);
orders(app);
products(app, upload);


server.listen(3000, '181.115.157.87' || 'localhost', function(){
    console.log('aplicacion de NodeJS' + port + 'iniciada...')
});



//error manejo de error
app.use((err, req, res, next) => {
    console.log(err);
    res.status(err.status || 500).send(err.stack);
});


module.exports = { //se usa esto para poder usar el app, server en los distintos archivos
    app: app,
    server: server
}
/*app.get('/', (req, res) => {
    res.send('Ruta raiz del backend');
});
app.get('/test', (req, res) => {
    res.send('este es la ruta test');
});*/
