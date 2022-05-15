class Admin::OrderDetailsController < ApplicationController
 
 def update
  @order = Order.find(params[:id])
 end
end
