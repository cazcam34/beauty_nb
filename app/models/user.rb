class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :products
  has_many :orders
  has_many :order_items, through: :orders
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :create_cart

  def create_cart
    @order = Order.create(user: self, status: "pending")
  end
end
