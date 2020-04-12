class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many   :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :name, :description, :condition, :price,
            :delivery_fee, :delivery_area, :delivery_day,
            :category_id, :user_id, presence: true
end
