const Product = require('../models/product');
const storage = require('../utils/cloud_storage');
const asyncForEach = require('../utils/async_foreach');
//const { findByCategory } = require('../models/product');

module.exports = {

    async findByCategory(req, res, next){
        try {
            const id_category  = req.params.id_category;//cliente
            const data = await Product.findByCategory(id_category);

            return res.status(201).json(data);
        } 
        catch (error) {
            console.log(`Error: ${error}`);
                return res.status(501).json({
                    message: `ERROR al listar el producto por categoria ${error} `,
                    success: false,
                    error: error
                });
        }
    },

    async create(req, res, next){
        let product = JSON.parse(req.body.product);
        const files = req.files;
    
        try {
            const data = await Product.create(product);
            product.id = data.id;
    
            const start = async () => {
                await asyncForEach(files, async(file)=>{
                    const pathImage = `image_${Date.now()}`;
                    const url = await storage(file, pathImage);
    
                    // Parte relacionada con las imágenes
                    // Si se obtiene una URL de imagen del almacenamiento en la nube, se asigna a la imagen correspondiente en el objeto del producto
                    // if(url !== undefined && url !== null){
                    //     if(inserts == 0){//imagen 1
                    //         product.image1 = url;
                    //     }
                    //     else if(inserts == 1){
                    //         product.image2 = url;
                    //     }
                    //     else if(inserts == 2){
                    //         product.image3 = url;
                    //     }
                    // }
    
                    await Product.update(product);
                    inserts = inserts + 1;
                    if(inserts == files.length){
                        return res.status(201).json({
                            success: true,
                            message: 'El Servicio se registró'
                        });
                    }
                });
            }
    
            start(); 
        } 
        catch (error) {
            console.log(`Error: ${error}`);
            return res.status(501).json({
                message: `ERROR al registrar el producto ${error} `,
                success: false,
                error: error
            });
        }
    }
}