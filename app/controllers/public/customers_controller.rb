class Public::CustomersController < ApplicationController

before_action :correct_customer, only: [:edit, :update, :withdrawal]

def show
 @customer = current_customer
end

def edit
 @customer = current_customer
end

def update
 @customer = current_customer
 if @customer.update(customer_params)
  flash[:notice] = "会員情報を更新しました。"
  redirect_to customers_path
 else
  flash[:alert] = "情報を正しく入力してください。"
  render :edit
 end
end

def unsubscribe
 @customer = current_customer
end

def withdrawal
 @customer = current_customer
 @customer.update(is_active: false)
 reset_session
 flash[:notice] = "退会処理を実行しました。"
 redirect_to root_path
end

private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_active)
  end

  def correct_customer
   @customer = current_customer
   redirect_to(customer_path(current_customer.id)) unless @customer == current_customer
  end

end
