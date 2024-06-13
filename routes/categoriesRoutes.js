const CategoriesController = require('../controllers/categoriesController');
const passport = require('passport');

module.exports = (app, upload) => {//app para manejar las peticiones res y el upload imagenes
//traer datos
app.get('/api/categories/getAll', CategoriesController.getAll);//esta ruta es la que definimops para el postman

//guardar datos
app.post('/api/categories/create', passport.authenticate('jwt',{session: false}),upload.array('image', 1), CategoriesController.create);

//actualizar datos
//401 es no autorizado


}