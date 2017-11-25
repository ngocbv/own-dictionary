class HomeController < ApplicationController
  def index
    if params['q']
      query_word = params['q'].strip.downcase
      word = Word.find_or_create_by(name: query_word, language: 'en')
      word_updated = word && word.updated
      unless word_updated
        OxfordDictionariesService.new.search(query_word)
        WordsApiService.new.search(query_word)
      end
      word.update updated: true
    end

    @word = word || Word.find_by(name: query_word)
    if @word
      @pronunciation = @word.pronunciation
      @meanings = @word.meanings.includes(:examples)
      TranslationHistory.find_or_create_by user: current_user, word: @word if current_user
    end
  end
end
