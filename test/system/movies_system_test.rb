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
end