class ProductsController < ApplicationController
<<<<<<< HEAD
=======
  before_action :set_product, only: [:show, :edit, :update]
>>>>>>> master

  def index
    @products = Product.all
    if params[:query].present?
      sql_query = "name ILIKE :query OR description ILIKE :query"
      @products = Product.where(sql_query, query: "%#{params[:query]}%")
    else
      @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
  end
<<<<<<< HEAD
=======

  def show
  end
>>>>>>> master

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

<<<<<<< HEAD
=======
  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

>>>>>>> master
  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end
