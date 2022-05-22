class Address < ApplicationRecord
 belongs_to :customer

 validates :postal_code, :name, :address, presence:  { message: "を正しく入力してください。" }

 def address_display
  '〒' + postal_code + ' ' + address + ' ' + name
 end
end
