class HomeController < ApplicationController
  def index
    if params['query']
      word = Word.find_by(name: params['query'])
      word_updated = word && word.updated
      OxfordDictionariesService.new.search(params['query']) unless word_updated
    end

    @word = word || Word.find_by(name: params['query'])
    @pronunciation = @word ? @word.pronunciation : {}
    @meanings = @word ? @word.meanings : []
    @examples = @word ? @word.examples : []
  end
end
