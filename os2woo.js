var async = require('async')
var ProgressBar = require('progress')
var WooCommerceAPI = require('woocommerce-api')
var chalk = require('chalk')
var config = require('./config')
var products = []
    var data = {
        product: {
            title: 'Premium Quality',
            type: 'simple',
            regular_price: '21.99',
            description: 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.',
            short_description: 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.',
            images: [{
                src: 'http://lorempixel.com/400/200/sports/',
                position: 0
            }, {
                src: 'http://lorempixel.com/400/200/sports/',
                position: 1
            }]
        }
    }
var WooCommerce = new WooCommerceAPI({
    url: config.url,
    consumerKey: config.consumerKey,
    consumerSecret: config.consumerSecret
})
console.log(chalk.bgBlue.bold('Starting the process ====> '));
console.log('\n---------------------------------------------------------------------------------------------\n');
console.log();
var barMessage = 'Proccessing :current of :total products [:bar] :percent :etas'
var green = '\u001b[42m \u001b[0m';
var bar = new ProgressBar(barMessage, {
    complete: green,
    incomplete: '-',
    width: 20,
    total: 10
});
for (var i = 0; i < 10; i++) {
    products.push(data)
}

function createProduct(product, callback) {
    WooCommerce.post('products', product, function(err, data, res) {
        // console.log(res)
        bar.tick(1)
        callback()
    });
}
var q = async.queue(createProduct, 5)
    // assign a callback
q.drain = function() {
    console.log(chalk.bgGreen.bold('Process finished'));
}
q.push(products)