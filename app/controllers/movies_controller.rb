class MoviesController < ApplicationController
  def index
    movies = Movie.all

    render locals: { movies: movies }
  end

  def show
    movie = Movie.find(params[:id])

    render locals: { movie: movie }
  end

  def new
    movie = Movie.new

    render locals: { movie: movie }
  end

  def create
    movie = Movie.new(movie_params)

    if movie.save
      redirect_to movie
    else
      render "new", locals: { movie: movie }
    end
  end

  def edit
    movie = Movie.find(params[:id])

    render locals: { movie: movie }
  end

  def update
    movie = Movie.find(params[:id])

    if movie.update(movie_params)
      redirect_to movie
    else
      render "edit", locals: { movie: movie }
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :director, :year)
  end
end