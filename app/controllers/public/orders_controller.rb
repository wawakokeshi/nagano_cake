class Public::OrdersController < ApplicationController

def new
 @order = Order.new
 @customer = current_customer
 @order.postal_code = @customer.postal_code
 @order.address = @customer.address
 @order.name = @customer.last_name + @customer.first_name
 @addresses = Address.where(customer_id: @customer.id).includes(:customer).order("created_at DESC")
end

def show
 @orders = current_customer.orders
 @orders = Order.all
 @items = Item.all
 #@order = Order.find(params[:id])
end

def index
 @orders = Order.all
end

def confirm
 @order = Order.new(order_params)
 @order.save
 @address = Address.find(params[:order][:address_id])
 @order.postal_code = @address.postal_code
 @order.address = @address.address
 @order.name = @address.name
 @cart_items = current_customer.cart_items
end

def create
 @order = Order.new(order_params)
 if @order.save
  redirect_to thanks_path
 else
  render :confirm
 end
end

def thanks
end

private
  def order_params
    params.require(:order).permit(:postal_code, :address, :postage, :billing_amount, :payment_method, :customer_id, :select_address, :name)
  end

end
