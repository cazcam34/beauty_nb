class Product < ApplicationRecord
  belongs_to :user
  has_many :order_items
  validates :name, uniqueness: true, presence: true
  validates :description, :price, presence: true
  validates :user_id, presence: true
end
