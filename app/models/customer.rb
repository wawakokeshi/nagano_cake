class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_many :addresses, dependent: :destroy
has_many :cart_items, dependent: :destroy
has_many :orders, dependent: :destroy

validates :email, presence: true
validates :password, presence: true
validates :first_name, presence: true
validates :last_name, presence: true
validates :last_name_kana, presence: true
validates :first_name_kana, presence: true
validates :postal_code, presence: true
validates :address, presence: true
validates :telephone_number, presence: true

enum is_active: { true: 0, false: 1 }

 def full_name
  self.last_name + self.first_name
 end
 

end
