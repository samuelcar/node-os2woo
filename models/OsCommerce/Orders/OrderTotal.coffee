orm = require '../../../connections/OsCommerce'

OrderTotal = orm.Models.extend
  tableName: 'orders_total'
  idAttribute: 'orders_total_id'

module.exports = OrderTotal
