const { findByUser } = require('../models/address');
const Order = require('../models/order')
const OrderHasProducts = require('../models/order_has_products');
const timeRelative = require('../utils/time_relative');

module.exports = {
    async getAll(req, res, next) {
        try {
            let data = await Order.getAll();
            data.forEach(d => {
                d.timestamp = timeRelative(new Date().getTime(), d.timestamp);
            });
            console.log('Orders: ', data);

            return res.status(200).json(data);
        } catch (error) {
            console.log(`Error ${error}`);
            return res.status(501).json({
                success: false,
                message: 'Hubo un error al obtener todas las órdenes',
                error: error
            });
        }
    },
    async findByStatus(req, res, next){
        try {

            const status = req.params.status;
            let data = await Order.findByStatus(status);
            data.forEach(d => {
                d.timestamp = timeRelative(new Date().getTime(), d.timestamp);//btenemos la fecha actual en la que estamos
            })
            console.log('Order: ', data);

            //console.log(`Status ${JSON.stringify(data)}`);

            return res.status(201).json(data);
            
        } catch (error) {
            console.log(`Error ${error}`);
            return res.status(501).json({
                success: false,
                message: 'Hubo un error ordenes por status',
                error: error
            });
        }
    },
    async findByClientAndStatus(req, res, next){
        try {
            const status = req.params.status;
            const id_client = req.params.id_client;
            let data = await Order.findByClientAndStatus(id_client, status);

            data.forEach(d => {
                d.timestamp = timeRelative(new Date().getTime(), d.timestamp);//btenemos la fecha actual en la que estamos
            })
                         console.log('Order: ', data);


            return res.status(201).json(data);
            
        } catch (error) {
            console.log(`Error ${error}`);
            return res.status(501).json({
                success: false,
                message: 'Hubo un error ordenes por status',
                error: error
            });
        }
    },
    async findByDeliveryAndStatus(req, res, next) {

        try {
            const status = req.params.status;
            const id_delivery = req.params.id_delivery;
            let data = await Order.findByDeliveryAndStatus(id_delivery, status);
            
            data.forEach(d => {
                d.timestamp = timeRelative(new Date().getTime(), d.timestamp);
            })

            // console.log('Order: ', data);

            return res.status(201).json(data);
        } 
        catch (error) {
            console.log(`Error ${error}`);    
            return res.status(501).json({
                message: 'Hubo un error al tratar de obtener las ordenes por estado',
                error: error,
                success: false
            })
        }

    },
    async create(req, res, next){
        try {

            const order = req.body;
            const data = await Order.create(order);
            console.log('La Correspondencia se creo bien')
            //recorrero todos los productos agragados a la orden 
            for(const product of order.products){
                await OrderHasProducts.create(data.id, product.id, product.quantity);
            }

            return res.status(201).json({
                success: true,
                message: 'La Correspondencia se creo correctamente',
                data: {
                    'id': data.id
                }
                
            });
            
        } catch (error) {
            console.log(`Error ${error}`);
            return res.status(501).json({
                success: false,
                message: 'Hubo un error creando la orden',
                error: error
            });
        }
    },
    async updateToDispatched(req, res, next) {
        try {
            
            let order = req.body;
            order.status = 'ASIGNADO';
            await Order.update(order);

           /* const user = await User.getNotificationTokenById(order.id_delivery);


            await pushNotificationController.sendNotification(user.notification_token, {
                title: 'PEDIDO ASIGNADO',
                body: 'Te han asignado un pedido',
                id_notification: '2'                
            })*/

            return res.status(201).json({
                success: true,
                message: 'La Correspondencia se actualizo correctamente',
            });

        } 
        catch (error) {
            console.log(`Error ${error}`);    
            return res.status(501).json({
                success: false,
                message: 'Hubo un error creando la orden',
                error: error
            });
        }
    },
    async updateToOnTheWay(req, res, next) {
        try {
            
            let order = req.body;
            order.status = 'EN CAMINO';
            await Order.update(order);

          /*  const user = await User.getNotificationTokenById(order.id_client);


            await pushNotificationController.sendNotification(user.notification_token, {
                title: 'TU PEDIDO ESTA EN CAMINO',
                body: 'Un repartidor esta en camino con tu pedido',
                id_notification: '3'                
            })*/
            
            return res.status(201).json({
                success: true,
                message: 'La Correspondencia se actualizo correctamente',
            });

        } 
        catch (error) {
            console.log(`Error ${error}`);    
            return res.status(501).json({
                success: false,
                message: 'Hubo un error creando la orden',
                error: error
            });
        }
    },
    async updateToDelivered(req, res, next) {
        try {
            
            let order = req.body;
            order.status = 'ENTREGADO';
            await Order.update(order);
            
            return res.status(201).json({
                success: true,
                message: 'La Correspondencia se actualizo correctamente',
            });

        } 
        catch (error) {
            console.log(`Error ${error}`);    
            return res.status(501).json({
                success: false,
                message: 'Hubo un error creando la orden',
                error: error
            });
        }
    },
    async updateLatLng(req, res, next) {
        try {
            
            let order = req.body;
            
            await Order.updateLatLng(order);
            
            return res.status(201).json({
                success: true,
                message: 'La Correspondencia se actualizo correctamente',
            });

        } 
        catch (error) {
            console.log(`Error ${error}`);    
            return res.status(501).json({
                success: false,
                message: 'Hubo un error creando la orden',
                error: error
            });
        }
    }
}