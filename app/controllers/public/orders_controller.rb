class Public::OrdersController < ApplicationController

def new
 @order = Order.new
end

def show
 @order = Order.find(params[])
end

def index
 @orders = Order.all
end


def create
end

def confirm
end

def thanks
end

end
