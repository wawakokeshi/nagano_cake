class Admin::OrdersController < ApplicationController

 def show
  @order = Order.find(params[:id])
  @order_details = OrderDetail.where(order_id: @order.id)
 end
 
 def update
  @order = Order.find(params[:id])
  @order.update(order_params)
  @order_details = @order.order_details
   if @order.is_active == "入金確認"
      @order_details.each do |order_detail|
        order_detail.is_active = "製作待ち"
        order_detail.save
      end
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
