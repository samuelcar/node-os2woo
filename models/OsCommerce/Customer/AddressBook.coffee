orm = require '../../../connections/OsCommerce'
Country = require './Country'

AddressBook = orm.Models.extend
  tableName: 'address_book'
  idAttribute: 'address_book_id'

  country: ->
    @hasOne Country, 'countries_id','entry_country_id'

module.exports = AddressBook
