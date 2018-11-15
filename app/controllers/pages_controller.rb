class PagesController < ApplicationController
  def home
  end

  def dashboard
  	favs
  end

  def favs
  	orders = Order.where(["user_id = ? and status = ?", current_user, "complete"])
 		@products = []
 		orders.each do |order|
 			order.products.each do |product|
 				@products << product
 			end
 		end
 		@products.uniq!
  end

  def wishlist
    favorites = Favorite.where(user_id: current_user)
    @products = []
    favorites.each do |fav|
      @products << Product.find(fav.product_id)
    end
    @products.uniq!
  end
end