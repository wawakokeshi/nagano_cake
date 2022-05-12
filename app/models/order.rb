class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  
  enum select_address: { self_address: 0, registered_address: 1, new_address: 2 }
  
end
