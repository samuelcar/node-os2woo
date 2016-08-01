orm = require '../../connections/OsCommerce'
Product = require './Product'
ProductOptionsValue = require './ProductOptionsValue'
ProductOptions = require './ProductOptions'

ProductAttibute = orm.Models.extend
  tableName: 'products_attributes'
  idAttribute: 'products_attributes_id'

  product: ->
    @belongsTo Product, 'product_id'

  value: ->
    @hasOne ProductOptionsValue, 'products_options_values_id',
    'options_values_id'

  name: ->
    @hasOne ProductOptions, 'products_options_id','options_id'

module.exports = ProductAttribute
