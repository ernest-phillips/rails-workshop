require "application_system_test_case"

class MoviesSystemTest < ApplicationSystemTestCase
  # class Movie
  #   attr_reader :movie_path
  #   def initialize(movie_path)
  #     @movie_path = movie_path
  #   end

  #   def movie_path(path)
  #     get 
  #   end
  # end
  test "visiting the show" do

    # movie = Movie.new(title: 'Parasite', director: 'Bong Joon-ho')
    # sign_in_as users(:user)
    visit movie_path(1)   

    assert_text 'Parasite'
    assert_text 'Bong Joon-ho'
    # assert_equal movie.title, 'Parasite'
    # assert_equal movie.director, 'Bong Joon-ho'
  end
end