class Admin::ItemsController < ApplicationController
 def index
  @items = Item.all
 end
 
 def show
  @item = Item.find(params[:id])
 end
 
 def edit
  @item = Item.find(params[:id])
 end
 
 def update
  @item = Item.find(params[:id])
 end
 
end
