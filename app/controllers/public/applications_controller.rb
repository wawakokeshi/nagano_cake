class Public::ApplicationsController < ApplicationController
  before_action :authenticate_customer!, except: [:top, :about, :index]
end
