const User = require('../models/user');
const Rol = require('../models/rol');
const bcrypt = require('bcryptjs');
//const passport = require('../config/passport');
const jwt = require('jsonwebtoken');
const keys = require('../config/keys');
///const { update } = require('../models/user');
const storage = require('../utils/cloud_storage');
var session = require('express-session')


module.exports = {

    async getAll(req, res, next){
        try {
            const data = await User.getAll();
            console.log(`Usuarios: ${data}`);
            return res.status(201).json(data);
        } 
        catch (error) {
            console.log(`Error: ${error}`);
            return res.status(501).json({
                success: false,
                message: 'error al obtener los usuarios'
            });
        }
    },
    async findDeliveryMen(req, res, next) {
        try {
            const data = await User.findDeliveryMen();    
            
            return res.status(201).json(data);
        } 
        catch (error) {
            console.log(`Error: ${error}`);
            return res.status(501).json({
                success: false,
                message: 'Error al obtener los usuarios'
            });
        }
    },

    async register(req, res, next){
        try {
            
            const user = req.body;
            const data = await User.create(user);
            
            await Rol.create(data.id, 1);
            const token = jwt.sign({ id: data.id, email: user.email }, keys.secretOrKey,{
                //expiresIn:
           })
           const myData = {
               id: data.id,
               name: user.name,
               lastname: user.lastname,
               email: user.email,
               phone: user.phone,
               image: user.image,
               session_token: `JWT ${token}`
           };
            return res.status(201).json({
                success: true,
                message: 'el registro se realizo correctamente',
                data: myData
            });

        } catch (error) {
            console.log(`Error: ${error}`);
            return res.status(501).json({
                success: false,
                message: 'Hubo un error con el registro del usuario',
                error: error
            });
        }
    },
    
    async login(req, res, next){
        try {
            
            const email = req.body.email;
            const password = req.body.password;

            const myUser = await User.findByEmail(email);
            if (!myUser){
                return res.status(401).json({
                    success: false,
                    message: 'el email no fue encontrado'
                })
            }

            const isPasswordValid = await bcrypt.compare(password, myUser.password);
            if (isPasswordValid){
                const token = jwt.sign({ id: myUser.id,email: myUser.email }, keys.secretOrKey,{
                     //expiresIn:
                })
                const data = {
                    id: myUser.id,
                    name: myUser.name,
                    lastname: myUser.lastname,
                    email: myUser.email,
                    phone: myUser.phone,
                    image: myUser.image,
                    session_token: `JWT ${token}`,
                    roles: myUser.roles
                };

                await User.updateSessionToken(myUser.id, `JWT ${token}`);


                console.log(`USUARIO ENVIADO ${data}`);
                return res.status(201).json({
                    success: true,
                    message:'el usuario a sido autenticado',
                    data: data
                });
            }
            else{
                return res.status(401).json({
                    success: false,
                    message:'la contraseña es incorrecta'
                });
            }
        } catch (error) {
            console.log(`Error: ${error}`);
            return res.status(501).json({
                success: false,
                message: 'Hubo un error con el login del usuario',
                error: error
            });
        }
    },
    async update(req, res, next){
         try {
            console.log('Usuario', req.body.user);

            const user = JSON.parse(req.body.user); //el cliente nos debe mandar un objeto
            console.log('Usuario Parseado', user);
            const files = req.files;

            if (files.length > 0) {//cliente envia un archivo
                
                const pathImage = `image_${Date.now()}`;//nombre del archivo
                const url = await storage(files[0], pathImage);

                if(url != undefined && url != null){
                    user.image = url;
                }


            }
            await User.update(user); //guardar la url en la base de datos
            return res.status(201).json({
                success: true,
                message: 'Los datos se actualizaron',
                data: user
            });

         } 
         catch (error) {
            console.log(`Error: ${error}`);
            return res.status(501).json({
                success: false,
                message: 'Hubo un error con la actualizacion de datos del usuario',
                error: error
            });
         }
    },

    async updateWithoutImage(req, res, next){
        try {
           console.log('Usuario', req.body);

           const user = req.body; //el cliente nos debe mandar un objeto
           console.log('Usuario Parseado', user);
    
           await User.update(user); //guardar la url en la base de datos
           
           return res.status(201).json({
               success: true,
               message: 'Los datos se actualizaron',
               data: user
           });

        } 
        catch (error) {
           console.log(`Error: ${error}`);
           return res.status(501).json({
               success: false,
               message: 'Hubo un error con la actualizacion de datos del usuario',
               error: error
           });
        }
   }
};