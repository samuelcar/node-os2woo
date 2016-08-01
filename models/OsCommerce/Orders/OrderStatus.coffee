orm = require '../../../connections/OsCommerce'

OrderStatus = orm.Models.extend
  tableName: 'orders_status'
  idAttribute: 'orders_status_id'

module.exports = OrderStatus
