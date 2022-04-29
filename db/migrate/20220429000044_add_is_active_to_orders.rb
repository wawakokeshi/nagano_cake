class AddIsActiveToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :is_active, :integer
  end
end
