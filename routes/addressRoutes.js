const AddressController = require('../controllers/addressController');
const passport = require('passport');

module.exports = (app, upload) => {//app para manejar las peticiones res y el upload imagenes
//traer datos
app.get('/api/address/findByUser/:id_user', AddressController.findByUser);//esta ruta es la que definimops para el postman

//guardar datos
app.post('/api/address/create', passport.authenticate('jwt',{session: false}), AddressController.create);

//actualizar datos
//401 es no autorizado


}