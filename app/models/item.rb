class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  has_one_attached :image

  validates :name, :info, :price, presence: true
  # 300円以上かつ9,999,999円以下
  validates :price
  validates :category_id, :item_status_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id, numericality: { other_than: 0, message: "can't be blank" }
end
