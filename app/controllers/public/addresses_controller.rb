class Public::AddressesController < ApplicationController

def index
 @address = Address.new
 @addresses = Address.all
end

def edit
 @address = Address.find(params[:id])
end

def create
 @address = Address.find(params[:id])
end

def update
 @address = Address.find(params[:id])
end

def destroy
 @address = Address.find(params[:id])
end

end
