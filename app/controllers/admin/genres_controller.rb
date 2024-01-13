class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  def index
    @genre = Genre.new
    @genres = Genres.all
  end

  def create
    @genre = Genre.new(genre_params)
  end

  def edit
  end

  def update
  end
  
  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
