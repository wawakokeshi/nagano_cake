# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
 # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_customer, only: [:create]
  skip_before_action :verify_authenticity_token
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

#protect_from_forgery

protected

def customer_state
  @customer = Customer.find_by(email: params[:customer][:email])
  return if !@customer
  if @customer.valid_password?(params[:customer][:password]) && (@customer.is_active == "有効")
   redirect_to customer_path(current_customer.id)
  else
   render new_customer_registration_path
  end
end

def reject_customer
  @customer = Customer.find_by(email: params[:customer][:email])
    if @customer
      if @customer.valid_password?(params[:customer][:password]) && (@customer.is_active == "退会")
        flash[:alert] = "退会済みです。"
        redirect_to new_customer_session_path
      end
    else
      flash[:alert] = "必須項目を入力してください。"
    end
end

  # If you have extra params to permit, append them to the sanitizer.
 # def configure_sign_in_params
    # devise_parameter_sanitizer.permit(:sign_in, keys: [:password, :email])
  #end
end
