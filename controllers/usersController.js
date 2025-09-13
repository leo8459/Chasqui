// controllers/usersController.js
const User = require('../models/user');
const Rol = require('../models/rol'); // Debe existir Rol.create(id_user, id_rol)
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const keys = require('../config/keys');
const storage = require('../utils/cloud_storage');

module.exports = {
  async getAll(req, res) {
    try {
      const data = await User.getAll();
      return res.status(200).json(data);
    } catch (error) {
      console.error(`Error: ${error}`);
      return res.status(500).json({
        success: false,
        message: 'Error al obtener los usuarios'
      });
    }
  },

  async findDeliveryMen(req, res) {
    try {
      const data = await User.findDeliveryMen();
      return res.status(200).json(data);
    } catch (error) {
      console.error(`Error: ${error}`);
      return res.status(500).json({
        success: false,
        message: 'Error al obtener los usuarios'
      });
    }
  },

  async register(req, res) {
    try {
      const required = ['email', 'name', 'lastname', 'phone', 'password'];
      const missing = required.filter(k => !req.body || !req.body[k]);
      if (missing.length) {
        return res.status(400).json({
          success: false,
          message: `Faltan campos: ${missing.join(', ')}`
        });
      }

      const user = req.body;
      const data = await User.create(user);

      // Asigna rol por defecto 1 (ajusta si tu modelo usa otro orden/params)
      if (data && data.id) {
        await Rol.create(data.id, 1);
      }

      const token = jwt.sign({ id: data.id, email: user.email }, keys.secretOrKey);
      const myData = {
        id: data.id,
        name: user.name,
        lastname: user.lastname,
        email: user.email,
        phone: user.phone,
        image: user.image || '',
        session_token: `JWT ${token}`
      };

      return res.status(201).json({
        success: true,
        message: 'El registro se realizó correctamente',
        data: myData
      });
    } catch (error) {
      console.error(`Error: ${error}`);
      return res.status(500).json({
        success: false,
        message: 'Hubo un error con el registro del usuario',
        error: String(error)
      });
    }
  },

  async login(req, res) {
    try {
      const required = ['email', 'password'];
      const missing = required.filter(k => !req.body || !req.body[k]);
      if (missing.length) {
        return res.status(400).json({
          success: false,
          message: `Faltan campos: ${missing.join(', ')}`
        });
      }

      const { email, password } = req.body;
      const myUser = await User.findByEmail(email);

      if (!myUser) {
        return res.status(401).json({
          success: false,
          message: 'El email no fue encontrado'
        });
      }

      const isPasswordValid = await bcrypt.compare(String(password), myUser.password);
      if (!isPasswordValid) {
        return res.status(401).json({
          success: false,
          message: 'La contraseña es incorrecta'
        });
      }

      const token = jwt.sign({ id: myUser.id, email: myUser.email }, keys.secretOrKey);
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

      return res.status(200).json({
        success: true,
        message: 'El usuario ha sido autenticado',
        data
      });
    } catch (error) {
      console.error(`Error: ${error}`);
      return res.status(500).json({
        success: false,
        message: 'Hubo un error con el login del usuario',
        error: String(error)
      });
    }
  },

  async update(req, res) {
    try {
      // Si viene multipart/form-data con un campo 'user' como JSON string
      const rawUser = req.body.user ? req.body.user : null;
      const user = rawUser ? JSON.parse(rawUser) : req.body;

      let files = req.files || [];
      if (files.length > 0) {
        const pathImage = `image_${Date.now()}`;
        const url = await storage(files[0], pathImage);
        if (url) user.image = url;
      }

      await User.update(user);
      return res.status(200).json({
        success: true,
        message: 'Los datos se actualizaron',
        data: user
      });
    } catch (error) {
      console.error(`Error: ${error}`);
      return res.status(500).json({
        success: false,
        message: 'Hubo un error con la actualización de datos del usuario',
        error: String(error)
      });
    }
  },

  async updateWithoutImage(req, res) {
    try {
      const user = req.body;
      await User.update(user);
      return res.status(200).json({
        success: true,
        message: 'Los datos se actualizaron',
        data: user
      });
    } catch (error) {
      console.error(`Error: ${error}`);
      return res.status(500).json({
        success: false,
        message: 'Hubo un error con la actualización de datos del usuario',
        error: String(error)
      });
    }
  }
};
