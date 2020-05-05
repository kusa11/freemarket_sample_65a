class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :address

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d!@#\$%\^\&*\)\(+=._-]{7,255}\z/i
  VALID_KATAKANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  VALID_POSTAL_CODE = /\A\d{3}-?\d{4}\z/

  # second入力項目
  validates :nickname, presence: true, length: { maximum: 20 }, on: :validates_second
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX, message: 'は有効でありません。' }, on: :validates_second
  validates :password, presence: true, length: { in: 7..255 }, format: { with: VALID_PASSWORD_REGEX, message: 'は255文字以下に設定して下さい'}, on: :validates_second
  validates :birthday, presence: true, on: :validates_second
  validates :last_name, presence: true, length: { maximum: 20 }, on: :validates_second
  validates :first_name, presence: true, length: { maximum: 20 }, on: :validates_second
  validates :last_name_kana, presence: true, length: { maximum: 35 }, format: { with: VALID_KATAKANA_REGEX, message: 'はカタカナで入力して下さい。'}, on: :validates_second
  validates :first_name_kana, presence: true, length: { maximum: 35 }, format: { with: VALID_KATAKANA_REGEX, message: 'はカタカナで入力して下さい。'}, on: :validates_second


  # third入力項目
  validates :tel, presence: true, format: { with: VALID_PHONE_REGEX, message: 'は有効でありません。'}, on: :validates_third

  # fifth入力項目
  validates :last_name, presence: true, length: { maximum: 20 }, on: :validates_step3
  validates :first_name, presence: true, length: { maximum: 20 }, on: :validates_step3
  validates :last_name_kana, presence: true, length: { maximum: 35 }, format: { with: VALID_KATAKANA_REGEX, message: 'はカタカナで入力して下さい。'}, on: :validates_step3
  validates :first_name_kana, presence: true, length: { maximum: 35 }, format: { with: VALID_KATAKANA_REGEX, message: 'はカタカナで入力して下さい。'}, on: :validates_step3
  validates :zip, presence: true, length: { maximum: 8 }, format: { with: VALID_POSTAL_CODE, message: 'は有効でありません。' }, on: :validates_step3
  validates :city_name, presence: true, length: { maximum: 50 }, on: :validates_step3
  validates :block_name, presence: true, length: { maximum: 100 }, on: :validates_step3
  validates :bill_name, length: { maximum: 100 }, on: :validates_step3
  validates :tel, format: { with: VALID_PHONE_REGEX, message: 'は有効でありません。'}, allow_blank: true, on: :validates_step3

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
