require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test 'movie is valid with title' do
    movie = Movie.new(title: "Parasite", director: "Bong Joon-ho")
    movie.save

    assert_equal movie.title, 'Parasite'
    assert_equal movie.director, 'Bong Joon-ho'
  end

  test 'movie is not valid without a title' do
    movie = Movie.new(title: " ")  
    refute movie.valid?, "Expected movie to not be valid"     
  end

  test 'only returns movie titles' do
    movie = Movie.new(title: "My Title") 
    movie.save!
    assert_equal movie.title , "My Title"    
  end

  

  test 'lists movie titles' do
    Movie.create!(title: "Movie 1")
    Movie.create!(title: "Movie 2")

    titles = Movie.titles
    
    assert_equal ['Movie 1', 'Movie 2'], titles
  end

  test 'lists movies in order of facebook likes' do
    movie1 = Movie.create!(title: "Movie 1", facebook_likes: 100)
    movie2 = Movie.create!(title: "Movie 2", facebook_likes: 10)

    movies = Movie.most_fb_likes

    assert_equal [movie1, movie2], movies
  end

  test 'find a movie by title and return the year' do
    Movie.create!(title: "Movie 1", year: "2022")
    Movie.create!(title: "Movie 2", year: "1980")

    year = Movie.release_year_by_title("Movie 1")

    assert_equal "2022", year
  end

  test "counts movies with more facebook likes" do 
    movie1 = Movie.create!(title: "Movie 1", facebook_likes: 100 )
    movie2 = Movie.create!(title: "Movie 2", facebook_likes: 2)

    count = Movie.count_with_facebook_likes(10)
    assert_equal movie1, count.first
  end
end

# Make a method that returns an array of just movie titles.

# Make a method that returns all movies in order of most to least Facebook likes.

# Make a method that can find a movie by its title, and tell you what year it was released.

# Make a method that returns the number of movies in the database with more than a given number of Facebook likes