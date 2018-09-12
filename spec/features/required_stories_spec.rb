require 'rails_helper'

describe 'a user' do
  context 'entering a word' do
    it 'will be informed if word is valid or not' do
      word_1 = 'foxes'

      visit '/'

      fill_in :word_search, with: word_1
      click_on 'Validate Word'
      expect(page).to have_content("‘foxes’ is a valid word and its root form is 'fox'.")

    end
  end
end

# :443
# *Feature 1: Word Validator*
#
# ```
# Background:
# * This story should use the Oxford Dictionaries API https://developer.oxforddictionaries.com/documentation
# * Use endpoint “GET /inflections/{source_lang}/{word_id}” under the “Lemmatron” heading
#
# Feature:
# As a guest user (no sign in necessary)
# When I visit “/”
# And I fill in a text box with “foxes”
# And I click “Validate Word”
# Then I should see a message that says “‘foxes’ is a valid word and its root form is ‘fox’.”
#
# As a guest user
# When I visit “/”
# And I fill in a text box with “foxez”
# And I click “Validate Word”
# Then I should see a message that says “‘foxez’ is not a valid word.”

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
