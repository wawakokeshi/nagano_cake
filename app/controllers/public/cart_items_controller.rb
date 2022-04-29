class Public::CartItemsController < ApplicationController

def index
 @cart_items = CartItem.all
 #@item = Item.find(params[:item_id])
 @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
end

def update
end

def destroy
 cart_item = CartItem.find(params[:id])
 cart_item.delete
 redirect_to cart_items_path
end

def destroy_all
 current_user.cart_items.destroy_all
end

def create
 @cart_item = CartItem.new(params_cart_item)
 @cart_item.customer_id=current_customer.id
 @cart_items=current_customer.cart_items.all
 @cart_items.each do |cart_item|
  if cart_item.item_id==@cart_item.item_id
    new_amount = cart_item.amount + @cart_item.amount
    cart_item.update_attribute(:amount, new_amount)
    @cart_item.delete
  end
 end
 @cart_item.save
  redirect_to cart_items_path, notice:"カートに商品が入りました"
end

private
  def params_cart_item
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end

end
