class ShippingAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  validates :postal_code, :city, :address, :phone_number, presence: true
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
end
