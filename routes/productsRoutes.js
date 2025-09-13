const ProductsController = require('../controllers/productsController');
const passport = require('passport');

module.exports = (app, upload) => {

    app.get('/api/products/findByCategory/:id_category',  ProductsController.findByCategory);

    app.post('/api/products/create', upload.array('image', 3), ProductsController.create);

}