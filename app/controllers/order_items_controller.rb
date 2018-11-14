class OrderItemsController < ApplicationController
  before_action :set_order, only: [:create]

  def create
    if !@order
      @order = Order.create(user_id: current_user, status: "pending")
    end
    if @order.order_items.find_by(product_id: params[:product_id])
      set_order_item
      @order_item.qty += 1
      @order_item.save
    else
      @order_item = OrderItem.create(product_id: params[:product_id], order_id: @order.id)
    end
    flash[:notice] = 'Item has been added to cart'
    redirect_to product_path(params[:product_id])
  end

  private

  def set_order
    @order = current_user.orders.find_by(status: "pending")
  end

  def set_order_item
    @order_item = @order.order_items.find_by(product_id: params[:product_id])
  end
end
