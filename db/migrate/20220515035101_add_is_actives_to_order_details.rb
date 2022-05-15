class AddIsActivesToOrderDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :order_details, :is_active, :integer, default:0
  end
end
