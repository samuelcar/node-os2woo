orm = require '../../../connections/OsCommerce'

OrderProductAttribute = orm.Models.extend
  tableName: 'orders_products_attributes'
  idAttribute: 'orders_products_attributes_id'

module.exports = OrderProductAttribute
