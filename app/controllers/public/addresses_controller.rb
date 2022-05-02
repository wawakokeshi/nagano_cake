class Public::AddressesController < ApplicationController

before_action :correct_user, only: [:new, :edit, :destroy, :update]

def index
 @addresses = Address.all
 @address = Address.new
end

def edit
 @address = Address.find(params[:id])
end

def create
 @address = Address.new(address_params)
 if @address.save
  redirect_to addresses_path
 else
  @addresses = Address.all
  render :index
 end
end

def update
 @address = Address.find(params[:id])
 if @address.update(address_params)
  redirect_to addresses_path
 else
  @addresses = Address.all
  render :index
 end
end

def destroy
 address = Address.find(params[:id])
 address.delete
 redirect_to addresses_path
end

private

def address_params
 params.require(:address).permit(:name, :postal_code, :address, :customer_id)
end

def correct_user
 @address = Address.find(params[:id])
 @customer = @address.customer
 redirect_to(root_path) unless @customer == current_user
end
 

end
