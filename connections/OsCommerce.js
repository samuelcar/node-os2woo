var Sequelize = require('sequelize')
var config = require('./../config')
var sequelize = new Sequelize(config.osDb, config.osUser, config.osPass, {
    host: config.osHost,
    // logging: false,
    define: {
        timestamps: false
    }	
});
var Product = sequelize.define('products', {
    id: {
        type: Sequelize.INTEGER,
        field: 'products_id',
        primaryKey: true,
        autoincrement: true
    },
    status: {
        type: Sequelize.BOOLEAN,
        field: 'products_status'
    },
    model: {
        type: Sequelize.STRING(12),
        field: 'products_model'
    },
    price: {
        type: Sequelize.DOUBLE(15, 4),
        field: 'products_price'
    },
    inStock: {
    	type: Sequelize.BOOLEAN,
    	field: 'products_inStock'
    },
    image: {
    	type: Sequelize.STRING(64),
    	field: 'products_image'
    },

});

var Category = sequelize.define('categories', {
	id: {
		type: Sequelize.INTEGER,
		field: 'categories_id',
		autoincrement: true,
		primaryKey: true
	},
});

var CategoryDescription = sequelize.define('categories_description', {
	id: {
		type: Sequelize.INTEGER,
		field: 'categories_id',
		autoincrement: true,
		primaryKey: true
	},
	name: {
		type: Sequelize.STRING,
		field: 'category_name'
	}
});

Category.hasOne(CategoryDescription);
Category.belongsToMany(Product, {as: 'Products',  through: 'products_to_categories', foreignKey: 'categories_id'})
Product.belongsToMany(Category, { as: 'Categories', through: 'products_to_categories', foreignKey: 'products_id'})



Product.findOne().then(function(product) {
	product.getCategories().then(function(result){
		console.log(result);
	});
});