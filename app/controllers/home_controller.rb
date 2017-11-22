class HomeController < ApplicationController
  def index
    if params['q']
      word = Word.find_by(name: params['q'])
      word_updated = word && word.updated
      OxfordDictionariesService.new.search(params['q']) unless word_updated
    end

    @word = word || Word.find_by(name: params['q'])
    if @word
      @pronunciation = @word.pronunciation
      @meanings = @word.meanings
      TranslationHistory.find_or_create_by user: current_user, word: @word if current_user
    end
  end
end
