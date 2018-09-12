class Word
  attr_reader :valid, :word_name, :root

  def initialize(word_info)
    @valid = word_info[:results].empty? == false
    @word_name = word_info[:results][0][:id]
    @root = word_info[:results][0][:lexicalEntries][0][:inflectionOf][0][:id]
  end
end
