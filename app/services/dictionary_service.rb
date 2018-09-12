class DictionaryService
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def validate_and_root
    get_json("/api/v1/inflections/en/#{word}")
  end
  # /api/v1

  private
  def conn
    Faraday.new('https://od-api.oxforddictionaries.com') do |faraday|
      faraday.headers['app_id'] = ENV['OXFORD_API_ID']
      faraday.headers['app_key'] = ENV['OXFORD_API_KEY']
      faraday.adapter(Faraday.default_adapter)
    end
  end

  def get_json(url)
    begin
      JSON.parse(conn.get(url).body, symbolize_names: true) if !!JSON.parse(conn.get(url).body, symbolize_names: true)
    rescue JSON::ParserError
      return false
    end
  end
end
