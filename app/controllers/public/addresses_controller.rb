class Public::AddressesController < ApplicationController

#protect_from_forgery

def index
 @address = Address.new
 @addresses = Address.all
 @addressid = Address.find(params[:id])
 #@addressid.customer_id = current_customer.id
end

def edit
 @address = Address.find(params[:id])
 #@address.customer_id = current_customer.id
end

def create
 @customer = current_customer
 @address = Address.new(address_params)
 @address.customer_id = current_customer.id
 if @address.save
  redirect_to addresses_path(@customer.id)
 else
  @addresses=current_customer.address.all
  render addresses_path(@customer.id)
 end
end

def update
 @customer = current_customer
 @address.customer_id = current_customer.id
 @address = Address.find(params[:id])
 if @address.update(address_params)
  redirect_to addresses_path(@customer.id)
 else
  render :edit
 end
end

def destroy
 address = Address.find(params[:id])
 address.delete
 redirect_to address_path
end

private

def address_params
 params.require(:address).permit(:name, :postal_code, :address, :customer_id)
end

end
