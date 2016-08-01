orm = require '../../../connections/OsCommerce'
OrderStatus = require './OrderStatus'
OrderProduct = require ' ./OrderProduct'
OrderTotal = require './OrderTotal'

Order = orm.Models.extend
  tableName: 'orders'
  idAttribute: 'orders_id'

  status: ->
    @hasOne OrderStatus, 'orders_status_id', 'orders_status'

  products: ->
    @hasMany OrderProduct, 'orders_id', 'orders_id'

  total: ->
    @hasMany OrderTotal, 'orders_id', 'orders_id'


module.exports = Order
