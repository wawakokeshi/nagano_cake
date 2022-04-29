class Public::OrdersController < ApplicationController

def new
 @order = Order.new
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
end

def thanks
end

private
  def order_params
    params.require(:order).permit(:postal_code, :address, :postage, :billing_amount, :payment_method, :customer_id)
  end

end
