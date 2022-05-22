class Public::AddressesController < ApplicationController

before_action :correct_user, only: [:new, :edit, :destroy, :update]

def index
 @customer = current_customer
 @addresses = Address.where(customer_id: @customer.id).includes(:customer).order("created_at DESC")
 @address = Address.new
end

def edit
 @address = Address.find(params[:id])
end

def create
 @address = Address.new(address_params)
 @address.customer_id = current_customer.id
 if @address.save
  flash[:notice] = "配送先を登録しました。"
  redirect_to addresses_path
 else
  @customer = current_customer
  @addresses = Address.where(customer_id: @customer.id).includes(:customer).order("created_at DESC")
  render :index
 end
end

def update
 @address = Address.find(params[:id])
 if @address.update(address_params)
  flash[:notice] = "配送先情報を更新しました。"
  redirect_to addresses_path
 else
  flash[:alert] = "情報を正しく入力してください。"
  @address = Address.find(params[:id])
  render :edit
 end
end

def destroy
 address = Address.find(params[:id])
 address.delete
 flash[:notice] = "配送先を削除しました。"
 redirect_to addresses_path
end

private

def address_params
 params.require(:address).permit(:name, :postal_code, :address, :customer_id)
end

def correct_user
 @address = Address.find(params[:id])
 @customer = @address.customer
 redirect_to(root_path) unless @customer == current_customer
end


end
