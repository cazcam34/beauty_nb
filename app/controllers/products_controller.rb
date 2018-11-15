class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.where.not(user: current_user)
    if params[:query].present?
      sql_query = "name ILIKE :query OR description ILIKE :query"
      @products = @products.where(sql_query, query: "%#{params[:query]}%")
    else
      @products = Product.where.not(user: current_user)
    end
  end

  def show
    # ...
    @order_item = OrderItem.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def edit
    if current_user != @product.user
      redirect_to(@product, notice: "You cannot edit this product")
    end
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    if current_user != @product.user
      redirect_to(@product, notice: "You cannot delete this product")
    else
      @product.destroy
      redirect_to products_path
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :photo)
  end
end
