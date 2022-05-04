class Public::CartItemsController < ApplicationController

def index
 @cart_items = CartItem.all
 @cart_item = CartItem.new
 #@total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
end

def create
 if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
  cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
  cart_item.amount += params[:cart_item][:amount].to_i
  cart_item.save
  redirect_to cart_items_path
 else
  cart_item = CartItem.new(cart_item_params)
  cart_item.save
  redirect_to cart_items_path
 end
end


def update
 @cart_item = CartItem.find(params[:id])
 if @cart_item.update(cart_item_params)
  redirect_to cart_items_path(@cart_item.id)
 else
  @cart_items = CartItem.all
  #@total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  render :index
 end
end

def destroy
 cart_item = CartItem.find(params[:id])
 cart_item.delete
 redirect_to cart_items_path
end

def destroy_all
 current_customer.cart_items.destroy_all
 redirect_to cart_items_path
end

private
  def cart_item_params
   params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end

end
