class FavoritesController < ApplicationController

	def create
		@favorite = Favorite.create(product_id: params[:product_id], user_id: current_user.id)
		flash[:notice] = "This item has been saved to your wish list <a href='#{favorites_path}' style='color:white;'>(view here)</a>"

		redirect_to product_path(params[:product_id])
	end
end

# "This item has been saved to your wish list - <a href='#{favorites_path}'>(view here)</a>".html_safe
