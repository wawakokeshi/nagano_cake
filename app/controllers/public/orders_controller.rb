class Public::OrdersController < ApplicationController

def new
 @order = Order.new
 @addresses = current_customer.addresses.all
 @order.postal_code = current_customer.postal_code
 @order.address = current_customer.address
 @order.name = current_customer.last_name + current_customer.first_name
end

def show
 @order = current_customer
 @order = Order.find(params[:id])
 @order_detail = OrderDetail.find(params[:id])
 @order_details = OrderDetail.where(order_id: @order.id)
end

def index
 @orders = current_customer.orders.all
end

def confirm
 @order = Order.new(order_params)
 @cart_items = current_customer.cart_items
 if params[:order][:select_address] == "self_address"
   @customer = current_customer
   @order.postal_code = @customer.postal_code
			@order.address = @customer.address
			@order.name = @customer.last_name + @customer.first_name
 elsif params[:order][:select_address] == "registered_address"
   @address = Address.find(params[:order][:address_id])
   @order.postal_code = @address.postal_code
   @order.address = @address.address
   @order.name = @address.name
 elsif params[:order][:select_address] == "new_address"
   @order.postal_code = params[:order][:postal_code]
			@order.address = params[:order][:address]
			@order.name = params[:order][:name]
 end
end

def create
 @order = Order.new(order_params)
 @order.customer_id = current_customer.id
 if @order.save!
  current_customer.cart_items.each do |cart_item|
   @order_detail = OrderDetail.new
   @order_detail.item_id = cart_item.item_id
   @order_detail.amount = cart_item.amount
   @order_detail.price = (cart_item.item.price*1.1).floor
   @order_detail.order_id = @order.id
   @order_detail.save
  end
  current_customer.cart_items.destroy_all
  redirect_to thanks_path
 else
  @order = Order.new(order_params)
  @cart_items = current_customer.cart_items
  render :confirm
 end
end

def thanks
end

private
  def order_params
    params.require(:order).permit(:postal_code, :address, :postage, :billing_amount, :payment_method, :customer_id, :select_address, :name, :is_active)
  end

end
