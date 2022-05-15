class Admin::ItemsController < ApplicationController

 def new
  @item = Item.new
 end

 def create
  @item = Item.new(item_params)
  if @item.save
   redirect_to admin_items_path
  else
   @item = Item.new
   render :new
  end
 end

 def index
  @items = Item.page(params[:page])
 end

 def show
  @item = Item.find(params[:id])
 end

 def edit
  @item = Item.find(params[:id])
 end

 def update
  @item = Item.find(params[:id])
  @item.update(item_params)
  redirect_to admin_item_path(@item.id)
 end

private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :genre_id, :image, :is_active)
  end

end
