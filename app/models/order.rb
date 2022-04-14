class Order < ApplicationRecord
  belongs_to :customer
  
  enum payment_method: { クレジットカード: 1, 銀行: 2 }
end
