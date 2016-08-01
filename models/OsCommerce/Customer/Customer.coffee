orm = require '../../../connections/OsCommerce'
AddressBook = require './AddressBook'

Customer = orm.Models.extend
  tableName: 'customers'
  idAttribute: 'customers_id'

  addressBook: ->
    @hasMany AddressBook, 'customers_id', 'customers_id'

module.exports = Customer
