class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :address 
  accepts_nested_attributes_for :address

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d!@#\$%\^\&*\)\(+=._-]{7,255}\z/i
  VALID_KATAKANA_REGEX =  /\A[\p{katakana}\p{blank}ー－]+\z/
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  VALID_POSTAL_CODE = /\A\d{3}-?\d{4}\z/

  # ユーザー情報
  validates :nickname, presence: true, length: {maximum: 20}
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX, message: 'は有効でありません。' }
  validates :password, presence: true, length: {minimum: 7, maximum: 30}, format: { with: VALID_PASSWORD_REGEX, message: 'は255文字以下に設定して下さい'}, on: :create
  validates :birth_year, presence: true
  validates :birth_month, presence: true
  validates :birth_day, presence: true
  validates :last_name, presence: true, length: {maximum: 20}
  validates :first_name, presence: true, length: {maximum: 20}
  validates :last_name_kana, presence: true, length: {maximum: 20}, format: { with: VALID_KATAKANA_REGEX, message: 'はカタカナで入力して下さい。'}
  validates :first_name_kana, presence: true, length: {maximum: 20}, format: { with: VALID_KATAKANA_REGEX, message: 'はカタカナで入力して下さい。'}

  # 電話番号入力情報
  validates :phone_number, null: false, format: { with: VALID_PHONE_REGEX, message: 'は有効でありません。'}

  # アドレス情報
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true, format: { with: VALID_KATAKANA_REGEX, message: 'はカタカナで入力して下さい。'}
  validates :last_name_kana, presence: true, format: { with: VALID_KATAKANA_REGEX, message: 'はカタカナで入力して下さい。'}
  validates :post_number, presence: true
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :address_number, presence: true
  validates :building, presence: true
  validates :phone_number, presence: true, format: { with: VALID_PHONE_REGEX, message: 'は有効でありません。'}, allow_blank: true
  

  
  protected

  def password_required?
    if validation_context == :second
      !persisted? || !password.nil? || !password_confirmation.nil?
    end
  end

  def email_required?
    if validation_context == :second
      true
    end
  end
end
