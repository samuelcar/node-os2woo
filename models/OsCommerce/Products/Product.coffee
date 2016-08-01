Sequelize = require 'sequelize'
orm = require './orm'
Category = require './Category'

Product = orm.define 'products',
  id:
    type: Sequelize.INTEGER
    field: 'products_id'
    primaryKey: true
    autoincrement: true
  status:
    type: Sequelize.BOOLEAN
    field: 'products_status'
  model:
    type: Sequelize.STRING(12)
    field: 'products_model'
  price:
    type: Sequelize.DOUBLE(15, 4)
    field: 'products_price'
  inStock:
    type: Sequelize.BOOLEAN
    field: 'products_inStock'
  image:
    type: Sequelize.STRING(64)
    field: 'products_image'

Product.belongsToMany Category,
  as: 'Categories'
  through: 'products_to_categories'
  foreignKey: 'products_id'

 module.exports = Product
