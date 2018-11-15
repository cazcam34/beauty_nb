class PagesController < ApplicationController
  def home
  end

  def dashboard
  	favs
  	popular
  end

  def favs
  	orders = Order.where(["user_id = ? and status = ?", current_user, "complete"])
 		products = []
 		orders.each do |order|
 			order.products.each do |product|
 				products << product
 			end
 		end
 		@fav_products = products.uniq[0...6]
  end

  def wishlist
    favorites = Favorite.where(user_id: current_user)
    @products = []
    favorites.each do |fav|
      @products << Product.find(fav.product_id)
    end
    @products.uniq!
    
  def popular
  	products = Product.all
 		products_freq = Hash.new(0)
 		products.each do |product|
 			products_freq[product] = product.order_items.count
 		end
 		@popular_products = []
 		products_freq.sort_by { |_key, value| value }.reverse[0...6].each do |product|
 			@popular_products << product[0]
 		end

  end
end