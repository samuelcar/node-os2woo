Sequelize = require 'sequelize'
orm = require './orm'
CategoryDescription = require './CategoryDescription'
Product = require './Product'

Category = orm.define 'categories',
  id:
    type: Sequelize.INTEGER
    field: 'categories_id'
    autoincrement: true
    primaryKey: true

Category.hasOne CategoryDescription

Category.belongsToMany Product,
  as: 'Products'
  through: 'products_to_categories'
  foreignKey: 'categories_id'


module.exports = Category
