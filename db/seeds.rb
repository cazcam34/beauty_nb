require 'open-uri'
require 'json'

# puts 'Cleaning database...'
# Product.destroy_all

puts 'Creating products...'

data = JSON.load(open("https://makeup-api.herokuapp.com/api/v1/products.json?product_type=foundation"))

data[0...1].each do |product|
	p product["name"]
	p product["description"]
	p product["price"].to_i
	p product["image_link"]
	# Product.create(name: product["name"], description: product["description"], price: product["price"].to_i, photo: product["image_link"], user_id: 1)
end

puts 'Finished!'

