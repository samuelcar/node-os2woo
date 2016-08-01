orm = require '../../../connections/OsCommerce'
OrderProductAttribute = require './OrderProductAttribute'

OrderProduct = orm.Models.extend
  tableName: 'orders_products'
  idAttribute: 'orders_products_id'

  attributes: ->
    @hasOne OrderProductAttribute, 'orders_products_id','orders_products_id'

module.exports = OrderProduct
