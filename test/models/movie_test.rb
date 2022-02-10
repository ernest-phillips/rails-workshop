require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "movie is valid with a title" do
    movie = Movie.new(title: "Parasite", director: "Bong Joon-ho")
    assert_equal movie.title, "Parasite"
    assert_equal movie.director, "Bong Joon-ho"
  end

  test "movie is not valid without a title" do
    movie = Movie.new(title: " ")
    refute movie.valid?
  end

  # Make a method that returns an array of just movie titles.
  #
  test "lists movie titles" do
    Movie.create!(title: "Movie 1")
    Movie.create!(title: "Movie 2")

    titles = Movie.titles

    assert_equal ["Movie 1", "Movie 2"], titles
  end

  # Make a method that returns all movies in order of most to least Facebook likes.
  test "lists movies in order of facebook likes" do
    movie1 = Movie.create!(title: "Movie 1", facebook_likes: 100)
    movie2 = Movie.create!(title: "Movie 2", facebook_likes: 2)

    movies = Movie.sorted_by_facebook_likes

    assert_equal [movie1, movie2], movies
  end

  # Make a method that can find a movie by its title, and tell you what year it was released.
  test "find a movies by title and return the year" do
    Movie.create!(title: "Movie 1", year: "2022")
    Movie.create!(title: "Movie 2", year: "1982")

    year = Movie.release_year_by_title("Movie 1")

    assert_equal "2022", year
  end

  # Make a method that returns the number of movies in the database with more than a given number of Facebook likes
  test "counts movies with more facebook likes" do
    Movie.create!(title: "Movie 1", facebook_likes: 100)
    Movie.create!(title: "Movie 2", facebook_likes: 2)

    count = Movie.count_with_facebook_likes(10)

    assert_equal 1, count
  end
end