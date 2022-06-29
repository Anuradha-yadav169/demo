class Address < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :pincode, length: {maximum: 4}
end
