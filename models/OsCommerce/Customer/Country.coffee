orm = require '../../../connections/OsCommerce'
AddressBook = require './AddressBook'

Country = orm.Models.extend
  tableName: 'countries'
  idAttribute: 'countries_id'

  address: ->
    @hasMany AddressBook, 'entry_country_id', 'countries_id'

module.exports = Country
