class Public::AddressesController < ApplicationController

protect_from_forgery

def index
 @address = Address.new
 @addresses = Address.all
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
  redirect_to address_path
 else
  render :edit
 end
end

def destroy
 address = Address.find(params[:id])
 address.delete
 redirect_to address_path
end

def address_params
 params.require(:address).permit(:name, :postal_code, :address, :customer_id)
end

end
