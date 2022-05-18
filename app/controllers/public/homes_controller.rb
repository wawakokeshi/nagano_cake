class Public::HomesController < ApplicationController

def top
 @items = Item.where(is_active: true).limit(4)
 @genres = Genre.all
end

def about
end

end
