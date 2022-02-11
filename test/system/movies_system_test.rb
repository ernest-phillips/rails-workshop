require "application_system_test_case"

class MoviesSystemTest < ApplicationSystemTestCase
  test "visiting the show" do
    # As a user,
    # when I visit /movies/1
    # I see the title of the movie "Parasite"
    # I also see the name of the director "Bong Joon-ho"
    movie = create(:movie, title: "Parasite", director: "Bong Joon-hoo")

    visit movie_path(movie.id)
    assert_text "Parasite"
    assert_text "Bong Joon-ho"
  end

  test "visiting the show for a different movie" do
    # As a user,
    # When I visit a movie with the id of 2,
    # I see the title for that movie
    movie = create(:movie, title: "Other Movie")

    visit movie_path(movie.id)
    assert_text "Other Movie"
  end

  test "visiting the index page" do
    movie1 = create(:movie, title: "Parasite", director: "Bong Joon-ho")
    movie2 = create(:movie, title: "Titanic", director: "James Cameron")

    visit "/movies"

    assert_text "Parasite"
    assert_text "Bong Joon-ho"
    assert_text "Titanic"
    assert_text "James Cameron"
  end

  test "new button on index page" do
    visit movies_path

    assert_button "Add New Movie"

    click_on "Add New Movie"

    assert_current_path new_movie_path

    assert_selector ".form"
  end

  test "creating a new movie" do
    visit new_movie_path

    fill_in "Title", with: "A New Movie"

    click_on "Create"

    assert_text "A New Movie"

    movie = Movie.order(id: :desc).first
    assert_equal "A New Movie", movie.title
  end

  test "editing a new movie" do
    movie = create(:movie, title: "A Movie To Edit")

    visit movie_path(movie.id)

    click_on "Edit Movie"

    assert_selector ".form"

    fill_in "Title", with: "Edited Movie"

    click_on "Update"

    assert_text "Edited Movie"
  end
end