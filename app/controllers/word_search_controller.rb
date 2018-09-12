class WordSearchController < ApplicationController
  def index
    presenter = DictionaryPresenter.new(params[:search_word])
    @word = params[:search_word]
    @word_values = presenter.get_word_values
  end
end
