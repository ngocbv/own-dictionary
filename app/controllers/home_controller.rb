class HomeController < ApplicationController
  def index
    if params['q']
      word = Word.find_or_create_by(name: params['q'], language: 'en')
      word_updated = word && word.updated
      unless word_updated
        OxfordDictionariesService.new.search(params['q'])
        WordsApiService.new.search(params['q'])
      end
      word.update updated: true
    end

    @word = word || Word.find_by(name: params['q'])
    if @word
      @pronunciation = @word.pronunciation
      @meanings = @word.meanings.includes(:examples)
      TranslationHistory.find_or_create_by user: current_user, word: @word if current_user
    end
  end
end
