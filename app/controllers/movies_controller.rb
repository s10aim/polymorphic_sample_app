class MoviesController < ApplicationController
  def index
    @movies = Movie.order(id: :desc)
    @movie = Movie.new
  end

  def create
    Movie.create!(movie_params)
    redirect_to movies_path
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:url)
  end
end
