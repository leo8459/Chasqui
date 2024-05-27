const db = require('../config/config');

const Address = {};

Address.findByUser = (id_user) => {
    const sql = `
    SELECT 
        id,
        id_user,
        address,
        neighborhood,
        lat,
        lng,
        direccion
	FROM
	    address
	WHERE
	    id_user = $1
    `;
    return db.manyOrNone(sql, id_user)
}

Address.create = (Address) => {
    const sql = `
    INSERT INTO 
    address(
        id_user,
        address,
        neighborhood,
        lat,
        lng,
        created_at,
        updated_at,
        direccion
        
    )
    VALUES($1, $2, $3, $4, $5, $6, $7, $8) RETURNING id
    `;
    return db.oneOrNone(sql, [
        Address.id_user,
        Address.address,
        Address.neighborhood,
        Address.lat,
        Address.lng,
        new Date(),
        new Date(),
        Address.direccion,
    ]);
}

module.exports = Address;