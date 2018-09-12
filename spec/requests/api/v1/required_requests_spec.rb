require 'rails_helper'

describe "GET /api/v1/games/1" do
  it 'keeps score' do
    user_1 = User.create(name: 'Jeb')
    user_2 = User.create(name: 'George')
    game = Game.create(player_1_id: user_1.id, player_2_id: user_2.id)
    play_1 = user_1.plays.create(game_id: 1, word: 'fez', score: 15)
    play_2 = user_2.plays.create(game_id: 1, word: 'zek', score: 16)

    get "/api/v1/games/#{game.id}"
    expect(response).to be_successful
    game_display = JSON.parse(response.body, symbolize_names: true)
    binding.pry
    expect(game_display).to have_key(:game_id)
    expect(game_display).to have_key(:scores)
    expect(game_display[:scores].first[:score]).to eq(15)
  end
end

# *Feature 2: API - Viewing Game Score*
#
# Background: This story assumes the base data from running `rake db:seed`
#
# When I send a GET request to “/api/v1/games/1” I receive a JSON response as follows:
#
# ```{
#   "game_id":1,
#   "scores": [
#     {
#       "user_id":1,
#       "score":15
#     },
#     {
#       "user_id":2,
#       "score":16
#     }
#   ]
# }```
#
# *Feature 3: API - Posting a Play*
#
# Background: This story assumes the base data from running `rake db:seed`
#
# You can choose to send the user_id and word specified below however you’d like or are comfortable.
#
# When I send a POST request to “/api/v1/games/1/plays” with a user_id=1 and word=at
# Then I should receive a 201 Created Response
#
# When I send a GET request to “/api/v1/games/1" I receive a JSON response as follows:
#
# ```{
#   "game_id":1,
#   "scores": [
#     {
#       "user_id":1,
#       "score":17
#     },
#     {
#       "user_id":2,
#       "score":16
#     }
#   ]
# }```
