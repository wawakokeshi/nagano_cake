class Public::ApplicationsController < ApplicationController
  before_action :authenticate_customer!, except: [:top, :about, :index]

   def after_sign_in_path_for(resource)
    customer_path(current_customer.id)
   end

   def after_sign_out_path_for(resource)
    root_path
   end
end
