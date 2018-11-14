class OrdersController < ApplicationController
  
  before_action :set_product, only: [:show, :checkout, :complete]

  def show
  end

  def checkout
		@order.status = "complete"
		@order.save
		redirect_to orders_complete_path
  end

  def complete
  end

  private

  def set_product
    @order = Order.find(params[:id])
  end
end
