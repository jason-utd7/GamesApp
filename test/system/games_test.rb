
require "application_system_test_case"
class GamesTest < ApplicationSystemTestCase
  setup do
    # Set up a sample game using fixtures or factories
    @game = games(:one)
  end

  # Test visiting the games index page
  test "visiting the index" do
    visit games_url
    assert_selector "h1", text: "Games"
  end

  # Test creating a new game
  test "should create game" do
    visit games_url
    click_on "New Game"

    # Fill in the form with movie attributes
    fill_in "Title", with: @game.title
    fill_in "Description", with: @game.description
    fill_in "Release date", with: @game.release_date
    click_on "Create Game"

    # Assert that the user is redirected and sees a success message
    assert_text "Game was successfully created"
    click_on "Back"
  end

  # Test updating an existing game
  test "should update game" do
    visit game_url(@game)
    click_on "Edit this game", match: :first

    # Fill in the form with updated game attributes
    fill_in "Title", with: @game.title
    fill_in "Description", with: @game.description
    fill_in "Release date", with: @game.release_date
    click_on "Update Game"

    # Assert that the user is redirected and sees a success message
    assert_text "Game was successfully updated"
    click_on "Back"
  end

  # Test destroying an existing game
  test "should destroy game" do
    visit game_url(@game)
    click_on "PLease Click to Destroy this game", match
  end
end
