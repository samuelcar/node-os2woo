orm = require '../../connections/OsCommerce'
Product = require './Product'

ProductSpecial = orm.Models.extend
  tableName: 'specials'
  idAttribute: 'specials_id'

  product: ->
    @belongsTo Product, 'products_id', 'products_id'

module.exports = ProductSpecial
