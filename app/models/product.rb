class Product < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :favorites
  
  validates :name, uniqueness: true, presence: true
  validates :description, :price, presence: true
  validates :user_id, presence: true
  validates :photo, presence: true

  mount_uploader :photo, PhotoUploader
end
