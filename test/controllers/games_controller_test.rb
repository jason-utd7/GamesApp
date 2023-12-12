# test/controllers/games_controller_test.rb

require "test_helper"

class GamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    # Set up a sample game using fixtures or factories
    @game = games(:one)
  end

  # Test whether the index page can be accessed successfully
  test "should get index" do
    get games_url
    assert_response :success
  end

  # Test whether the new page can be accessed successfully
  test "should get new" do
    get new_game_url
    assert_response :success
  end

  # Test whether a new game can be created successfully
  test "should create game" do
    assert_difference("Game.count") do
      # Send a POST request with game parameters
      post games_url, params: { game: { title: @game.title, description: @game.description, release_date: @game.release_date } }
    end

    # Assert that the user is redirected to the newly created game's page
    assert_redirected_to game_url(Game.last)
  end

  # Test whether the show page for a game can be accessed successfully
  test "should show game" do
    get game_url(@game)
    assert_response :success
  end

  # Test whether the edit page for a game can be accessed successfully
  test "should get edit" do
    get edit_game_url(@game)
    assert_response :success
  end

  # Test whether a game can be updated successfully
  test "should update game" do
    # Send a PATCH request with updated game parameters
    patch game_url(@game), params: { game: { title: @game.title, description: @game.description, release_date: @game.release_date } }
    assert_redirected_to game_url(@game)
  end

  # Test whether a game can be destroyed successfully
  test "should destroy game" do
    assert_difference("Game.count", -1) do
      # Send a DELETE request to delete a game
      delete game_url(@game)
    end

    # Assert that the user is redirected to the games index page
    assert_redirected_to games_url
  end
end
