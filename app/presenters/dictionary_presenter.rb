class DictionaryPresenter
  attr_reader :service, :word

  def initialize(word)
    @word = word
    @service = DictionaryService.new(word)
  end

  def get_word_info
    @service.validate_and_root
  end

  def get_word_values
    if get_word_info == false || get_word_info.empty?
      return nil
    else get_word_info != false
      Word.new(get_word_info)
    end
  end
end
