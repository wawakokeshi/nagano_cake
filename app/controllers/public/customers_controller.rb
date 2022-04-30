class Public::CustomersController < ApplicationController

before_action :correct_customer, only: [:edit, :update, :withdrawal]

def show
 @customer = Customer.find(params[:id])
end

def edit
 @customer = Customer.find(params[:id])
end

def update
 @customer = Customer.find(params[:id])
 if @customer.update(customer_params)
  redirect_to customer_path(@customer.id)
 else
  render :edit
 end
end

def unsubscribe
 @customer = Customer.find(params[:id])
end

def withdrawal
 @customer = Customer.find(params[:id])
 @customer.update(is_active: false)
 reset_session
 flash[:notice] = "退会処理を実行いたしました"
 redirect_to root_path
end

private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end

  def correct_customer
   @customer = Customer.find(params[:id])
   redirect_to(customer_path(current_customer.id)) unless @customer == current_customer
  end

end
