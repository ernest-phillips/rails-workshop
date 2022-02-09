class MoviesController < ApplicationController
  def show
    render locals: {movie: Movie.find(params[:id])}
  end

  def index
    @movies = Movie.all 
  end

  def new

  end

  def create 
    # create a new movie with the information from the form
    # redirect to the show page for the new movie
  end
end