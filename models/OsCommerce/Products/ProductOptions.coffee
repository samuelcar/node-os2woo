orm = require '../../connections/OsCommerce'

ProductOptions = orm.Model.extend
  tableName: 'products_options'
  idAttribute: 'products_options_id'

module.exports = ProductOptions
