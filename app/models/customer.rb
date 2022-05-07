class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_many :addresses, dependent: :destroy
has_many :cart_items, dependent: :destroy
has_many :orders, dependent: :destroy

validates :email, presence:  { message: "正しく入力してください" }, uniqueness: true
validates :first_name, :last_name, :last_name_kana, :first_name_kana, :address, presence: { message: "正しく入力してください" }

VALID_TELEPHONE_NUMBER_REGEX = /\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z|\A0[5789]0[-]?\d{4}[-]?\d{4}\z/
validates :telephone_number, format: { with: VALID_TELEPHONE_NUMBER_REGEX }, presence: { message: "正しく入力してください" }

VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]?\d{4}\z/
validates :postal_code, format: { with: VALID_POSTAL_CODE_REGEX }, presence: { message: "正しく入力してください" }

enum is_active: { true: 0, false: 1 }

 def full_name
  self.last_name + self.first_name
 end
 

  
 

end
