class Product < ApplicationRecord
	belongs_to :user
	has_many :order_items
	has_many :orders, through: :order_items
	has_many :cart_items
	has_one_attached :image

	validates :name, presence: true
	validates :price, presence: true, numericality: {:greater_than => 0}
	validates :description, presence: true 
end
