class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true
  validates :first_name, :last_name, :first_name_kana, :last_name_kana, :post_number, :prefecture_id, :city, :address_number, :building, :phone_number, presence: true
end
