async = require('async')
ProgressBar = require('progress')
WooCommerceAPI = require('woocommerce-api')
chalk = require('chalk')
config = require('./config')

products = []
data = product:
  title: 'Premium Quality'
  type: 'simple'
  regular_price: '21.99'
  description: 'Pellentesque habitant morbi tristique senectus et netus et
    malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae,
    ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam
    egestas semper. Aenean ultricies mi vitae est.
    Mauris placerat eleifend leo.'
  short_description: 'Pellentesque habitant morbi tristique senectus et netus
    et malesuada fames ac turpis egestas.'
  images: [
    {
      src: 'http://lorempixel.com/400/200/sports/'
      position: 0
    }
    {
      src: 'http://lorempixel.com/400/200/sports/'
      position: 1
    }
  ]

WooCommerce = new WooCommerceAPI
  url: config.url
  consumerKey: config.consumerKey
  consumerSecret: config.consumerSecret

createProduct = (product, callback) ->
  WooCommerce.post 'products', product, (err, data, res) ->
    bar.tick 1
    callback()

console.log chalk.bgBlue.bold('Starting the process ====> ')
console.log '\n-------------------------------------------------------------\n'
console.log()
barMessage = 'Proccessing :current of :total products [:bar] :percent :etas'
green = '[42m [0m'

bar = new ProgressBar barMessage,
  complete: green
  incomplete: '-'
  width: 20
  total: 10

i = 0
while i < 10
  products.push data
  i++

q = async.queue(createProduct, 5)

q.drain = -> console.log chalk.bgGreen.bold('Process finished')

q.push products
