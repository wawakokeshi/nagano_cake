class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :postage, default: 500
      t.integer :billing_amount
      t.integer :payment_method, default: 0
      t.timestamps
    end
  end
end
