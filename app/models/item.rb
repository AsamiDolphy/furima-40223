class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order

  belongs_to :category
  belongs_to :item_status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  has_one_attached :image

  validates :image, :name, :info, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, presence: true
  validates :category_id, :item_status_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id, presence: true
end
