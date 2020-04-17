class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_day

  belongs_to :user
  belongs_to :category
  has_many   :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :name, :description, :condition_id, :price,
            :delivery_fee_id, :prefecture_id, :delivery_day_id,
            :category_id, :user_id, presence: true
end
