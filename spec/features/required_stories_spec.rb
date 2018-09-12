require 'rails_helper'

describe 'a user' do
  context 'entering a word' do
    it 'will be informed if word is valid or not' do
      word_1 = 'foxes'
      stub_request(:get, "https://od-api.oxforddictionaries.com/api/v1/inflections/en/foxes").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'App-Id'=>'2546e36e',
       	  'App-Key'=>'3fc216757485e485c0291883c053b7d7',
       	  'User-Agent'=>'Faraday v0.15.2'
           }).
         to_return(status: 200, body: File.read("./spec/mock_requests/foxes.json"), headers: {})

      visit '/'

      fill_in :search_word, with: word_1
      click_on 'Validate Word'
      expect(current_path).to eq('/word_search')
      expect(page).to have_content("'foxes' is a valid word and its root form is 'fox'.")
    end
    it 'will return invalid if word not valid' do
      word = 'foxez'

      stub_request(:get, "https://od-api.oxforddictionaries.com/api/v1/inflections/en/foxez").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'App-Id'=>'2546e36e',
       	  'App-Key'=>'3fc216757485e485c0291883c053b7d7',
       	  'User-Agent'=>'Faraday v0.15.2'
           }).
         to_return(status: 200, body: "{}", headers: {})

      visit '/'

      fill_in :search_word, with: word
      click_on 'Validate Word'
      expect(current_path).to eq('/word_search')
      expect(page).to have_content("'#{word}' is not a valid word.")
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

#
