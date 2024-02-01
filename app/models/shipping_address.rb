class ShippingAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to :prefecture
  belongs_to :order

  # validates :postal_code, :city, :address, :phone_number, presence: true
  # validates :prefecture_id
end
