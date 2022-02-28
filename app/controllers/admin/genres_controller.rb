class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end
  
  def create
    @genres = Genre.all
    @genre = Genre.new(genre_params)
    #if @genre.save
     #flash[:success] = 'You have created genre successfully.'
     #redirect_to admin_genres_path
    #else
     #render :index
    #end
  end
  
  def edit
  end
  
  def update
  end
  
end
