orm = require '../../connections/OsCommerce'

ProductXsell = orm.Model.extend
  tableName: 'products_xsell'
  idAttribute: 'ID'

module.exports = ProductXsell
