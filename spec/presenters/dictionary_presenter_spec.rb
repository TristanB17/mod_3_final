require 'rails_helper'

describe DictionaryPresenter, type: :model do
  before(:each) do
    @address = "https://od-api.oxforddictionaries.com/api/v1/inflections/en/foxes"
    @mock = "./spec/mock_requests/foxes.json"
    @headers = {
   'Accept'=>'*/*',
   'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
   'App-Id'=>'2546e36e',
   'App-Key'=>'3fc216757485e485c0291883c053b7d7',
   'User-Agent'=>'Faraday v0.15.2'
    }
  end
  context 'formatting service info' do
    it 'makes a word_values object' do
      word = 'foxes'
      stub_request(:get, @address).with(headers: @headers).to_return(status: 200, body: File.read(@mock), headers: {})
      presenter = DictionaryPresenter.new(word)

      expect(presenter.get_word_info).to be_a(Hash)
      expect(presenter.get_word_values).to be_a(Word)
    end
  end
end
