require "application_system_test_case"

class MoviesSystemTest < ApplicationSystemTestCase
  
  test "visiting the show" do
    attributes = { title: "Parasite", director: "Bong Joon-ho"}
    Movie.new(attributes)
    # sign_in_as users(:user)
    visit movie_path(1)   

    assert_text 'Parasite'
    assert_text 'Bong Joon-ho'
    # assert_equal movie.title, 'Parasite'
    # assert_equal movie.director, 'Bong Joon-ho'
  end
end