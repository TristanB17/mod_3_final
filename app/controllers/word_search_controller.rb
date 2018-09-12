class WordSearchController < ApplicationController
  def index
    binding.pry
    presenter = DictionaryPresenter.new(params[:search_word])
    @word_values = presenter.get_word_info
  end
end
