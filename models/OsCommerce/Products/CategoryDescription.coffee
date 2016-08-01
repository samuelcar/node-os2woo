Sequelize = require 'sequelize'
orm = require './orm'

CategoryDescription = orm.define 'categories_description',
  id:
    type: Sequelize.INTEGER
    field: 'categories_id'
    autoincrement: true
    primaryKey: true
  name:
    type: Sequelize.STRING
    field: 'category_name'


module.exports = CategoryDescription
