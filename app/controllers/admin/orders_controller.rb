class Admin::OrdersController < ApplicationController

 def show
  @order = Order.find(params[:id])
  @order_details = OrderDetail.where(order_id: @order.id)
 end
 
 def update
  @order = Order.find(params[:id])
  if @order.update(order_params)
   redirect_to admin_order_path(@order.id)
  else
   @order_details = OrderDetail.where(order_id: @order.id)
   render :show
  end
 end
 
 def index
 end

private
  def order_params
    params.require(:order).permit(:is_active)
  end


end
