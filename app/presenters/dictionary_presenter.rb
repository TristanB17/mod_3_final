class DictionaryPresenter
  attr_reader :service

  def initialize(word)
    @service = DictionaryService.new(word)
  end

  def get_word_info
    @service.validate_and_root
  end
end
