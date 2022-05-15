class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  
  enum select_address: { self_address: 0, registered_address: 1, new_address: 2 }
  
  enum is_active: { 入金待ち: 0 , 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }
end
