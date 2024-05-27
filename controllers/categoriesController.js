//const { getAll } = require("../models/category");
const Category = require("../models/category");
//const { create } = require("../models/user");
const storage = require('../utils/cloud_storage');

module.exports = {
    async create(req, res, next){

        console.log('REQ BODY', req.body);

        try {

            const category = JSON.parse(req.body.category);//esto lo mandara nuestra aplicacion de android
            console.log('Category', category);//si no es envia un archivo

            const files = req.files;

            if (files.length > 0) {//cliente envia un archivo
                
                const pathImage = `image_${Date.now()}`;//nombre del archivo
                const url = await storage(files[0], pathImage);

                if(url != undefined && url != null){
                    category.image = url;//se le dice que se almacene en firebase su url
                }


            }

            const data = await Category.create(category);

            return res.status(201).json({
                success: true,
                message: 'La Servicio se creo bien',
                data: {
                    'id': data.id
                }
            });
            
        } catch (error) {
            console.log('Error', error);

            return res.status(501).json({
                success: false,
                message: 'Hubo un error en la creacion de la categoria',
                error: error
            });
        }

    },
    async getAll(req, res, next){

        try {
            const data = await Category.getAll();

            return res.status(201).json(data);
            
        } catch (error) {
            console.log('Error', error);

            return res.status(501).json({
                success: false,
                message: 'Hubo un error en la creacion de la categoria',
                error: error
            });
        }

    }
}