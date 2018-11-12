class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :products
  has_many :orders
  has_many :order_items, through: :products
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
