class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    @product.save
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end
