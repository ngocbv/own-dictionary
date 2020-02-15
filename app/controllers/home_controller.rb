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
      @meanings = @word.meanings.includes(:examples, :synonyms, :antonyms)
      if current_user
        history = TranslationHistory.find_by user: current_user, word: @word
        if history
          history.update_columns translated_count: history.translated_count + 1
        else
          TranslationHistory.create user: current_user, word: @word
        end
      end
    end
  end
end
