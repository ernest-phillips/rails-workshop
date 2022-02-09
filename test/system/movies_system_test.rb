require "application_system_test_case"
require 'test_helper'

class MoviesSystemTest < ApplicationSystemTestCase
  
  test "visiting the show" do
    attributes = { title: "Parasite", director: "Bong Joon-ho"}
    Movie.new(attributes)
    visit movie_path(1)   

    assert_text 'Parasite'
    assert_text 'Bong Joon-ho'
    
  end

  test "visiting the index page" do
    movie1 = Movie.create(title: "Parasite", director: "Bong Joon-ho")
    movie2 = Movie.create(title: "Titanic", director: "James Cameron")

    visit "/movies"

    assert_text "Parasite"
    assert_text "Bong Joon-ho"
    assert_text "Titanic"
    assert_text "James Cameron"
  end

  test "adding a new movie" do
    visit movies_path

    assert_button "Add New Movie"
    click_on "Add New Movie"
    assert_current_path "movies/new"

    assert_selector("form")
  end
end