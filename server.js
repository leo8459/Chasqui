// app.js
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
const expressSession = require('express-session');

const port = process.env.PORT || 3000;

// ---- Inicializaciones ----
app.use(expressSession({
  secret: 'This is one hell of a secret',
  resave: false,
  saveUninitialized: false
}));

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});

const upload = multer({ storage: multer.memoryStorage() });

// ---- Middlewares ----
app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cors());

app.use(passport.initialize());
app.use(passport.session());
require('./config/passport')(passport);

app.disable('x-powered-by');
app.set('port', port);

// ---- Rutas ----
const users = require('./routes/usersRoutes');
const categories = require('./routes/categoriesRoutes');
const products = require('./routes/productsRoutes');
const address = require('./routes/addressRoutes');
const orders = require('./routes/ordersRoutes');

users(app, upload);
categories(app, upload);
address(app);
orders(app);
products(app, upload);

// ---- Arranque ----
server.listen(port, '0.0.0.0', () => {
  console.log(`aplicacion de NodeJS ${port} iniciada...`);
});

// ---- Manejo de errores ----
app.use((err, req, res, next) => {
  console.error(err);
  const status = err.status || 500;
  res.status(status).json({
    success: false,
    message: err.message || 'Error interno del servidor'
  });
});

module.exports = { app, server };
