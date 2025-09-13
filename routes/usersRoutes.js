const UserController = require('../controllers/usersController');
const passport = require('passport');

module.exports = (app, upload) => {
//traer datos
app.get('/api/users/getAll', UserController.getAll);//esta ruta es la que definimops para el postman
app.get('/api/users/findDeliveryMen',passport.authenticate('jwt', {session: false}),UserController.findDeliveryMen);

//guardar datos
app.post('/api/users/create', UserController.register);
app.post('/api/users/login', UserController.login);

//actualizar datos
//401 es no autorizado


app.put('/api/users/update',  upload.array('image', 1), UserController.update);
app.put('/api/users/updateWithoutImage', UserController.updateWithoutImage);

}