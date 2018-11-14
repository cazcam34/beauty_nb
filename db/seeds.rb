require 'open-uri'
require 'json'

puts 'Cleaning database...'

OrderItem.destroy_all
Order.destroy_all
Product.destroy_all
User.destroy_all

puts 'Creating master users...'

lisa = User.create(email: "lisa@beautynb.com.au", first_name: "Lisa", last_name: "Conti", password: "password")
caroline = User.create(email: "caroline@beautynb.com.au", first_name: "Caroline", last_name: "Cameron", password: "password")
jessie = User.create(email: "jessie@beautynb.com.au", first_name: "Jessie", last_name: "Baxter", password: "password")

users = [
	lisa,
	caroline,
	jessie
]

puts 'Creating products...'

data = JSON.load(open("https://makeup-api.herokuapp.com/api/v1/products.json?product_type=lipstick"))

products = []

data[0...30].each do |product|
	new_product = Product.new(name: product["name"], description: product["description"], price: product["price"].to_i, user_id: users.sample.id)
	begin 
		new_product.remote_photo_url = product["image_link"]
		new_product.save
		products << new_product
	rescue
		puts "IMAGE DOESN'T WORK"
	end
end

puts 'Creating orders...'

orders = []

20.times do
	order = Order.create(user_id: users.sample.id)
	orders << order
end

puts 'Adding items to orders...'

30.times do 
	OrderItem.create(product_id: products.sample.id, order_id: orders.sample.id, qty: rand(1...4))
end

puts 'Finished!'