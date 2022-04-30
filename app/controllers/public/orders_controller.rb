class Public::OrdersController < ApplicationController

def new
 @order = Order.new
 @order.postal_code = current_customer.postal_code
 @order.address = current_customer.address
 @order.name = current_customer.first_name + current_customer.last_name
end

def show
 @order = Order.find(params[:id])
end

def index
 @orders = Order.all
end


def create
 @order = Order.new(order_params)
 @order.save
  redirect_to items_path
end

def confirm
 @order = Order.new(order_params)
 @address = Address.find(params[:order][:address_id])
 @order.postal_code = @address.postal_code
 @order.address = @address.address
 @order.name = @address.name
end

def thanks
end

private
  def order_params
    params.require(:order).permit(:postal_code, :address, :postage, :billing_amount, :payment_method, :customer_id)
  end

end
