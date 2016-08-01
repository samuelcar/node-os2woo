orm = require '../../connections/OsCommerce'

ProductOptionsValues = orm.Model.extend
  tableName: 'products_options_values'
  idAttribute: 'products_options_values_id'

  attribute: ->
    @belongsTo ProductAttribute, 'products_options_values_id',
      'products_options_values_id'
