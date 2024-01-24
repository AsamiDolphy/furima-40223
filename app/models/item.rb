class Item < ApplicationRecord
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to :category
  # belongs_to :item_status
  # belongs_to :shipping_fee
  # belongs_to :prefecture
  # belongs_to :scheduled_delivery

  # validates :name, :info, :price, presence: true
  # validates :category_id, :item_status_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id, numericality: { other_than: 0, message: "can't be blank" }
end
