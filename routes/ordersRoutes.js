const OrdersController = require('../controllers/ordersController');
const passport = require('passport');

module.exports = (app, upload) => {//app para manejar las peticiones res y el upload imagenes
//traer datos
app.get('/api/orders/findByStatus/:status', OrdersController.findByStatus);//esta ruta es la que definimops para el postman
app.get('/api/orders/findByClientAndStatus/:id_client/:status', OrdersController.findByClientAndStatus);//esta ruta es la que definimops para el postman
app.get('/api/orders/findByDeliveryAndStatus/:id_delivery/:status', OrdersController.findByDeliveryAndStatus);

//guardar datos
app.post('/api/orders/create',  OrdersController.create);


//PUT ROUTES

app.put('/api/orders/updateToDispatched', passport.authenticate('jwt', {session: false}), OrdersController.updateToDispatched);
app.put('/api/orders/updateToOnTheWay', passport.authenticate('jwt', {session: false}), OrdersController.updateToOnTheWay);
app.put('/api/orders/updateToDelivered', passport.authenticate('jwt', {session: false}), OrdersController.updateToDelivered);
app.put('/api/orders/updateLatLng', passport.authenticate('jwt', {session: false}), OrdersController.updateLatLng);

//actualizar datos
//401 es no autorizado


}