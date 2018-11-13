class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  def destroy
    @item = OrderItem.find(params[:id])
    @item.destroy
  end
end
