{OsCommerce} = require '../config.json'
{filename} = Local

knex = require 'knex'
bookshelf = require 'bookshelf'

connection = knex
  client: client
  connection: {
    filename
  }

module.exports = bookshelf connection
