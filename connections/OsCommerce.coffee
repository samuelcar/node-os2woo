{OsCommerce} = require '../config.json'
{client, host, user, password, database, charset} = OsCommerce

knex = require 'knex'
bookshelf = require 'bookshelf'

connection = knex
  client: client
  connection: {
    host, user, password, database, charset
  }

module.exports = bookshelf connection
