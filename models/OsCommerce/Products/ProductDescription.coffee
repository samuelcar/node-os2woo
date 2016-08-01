orm = require '../../connections/OsCommerce'
Product = require './Product'

ProductDescription = orm.Models.extend
  tableName: 'products_description'
  idAttribute: 'products_id'

  product: ->
    @belongsTo Product, 'products_id', 'products_id'
