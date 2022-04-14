class Admin::OrdersController < ApplicationController
    
 def show
  @orders = Order.all
  @order_details = OrderDetail.all
 end

end
