class User < ApplicationRecord
  has_many :cart_items
  has_many :addresses
  has_many :products
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable
end
