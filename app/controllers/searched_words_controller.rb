class SearchedWordsController < ApplicationController
  def create
    SearchedWord.create word: params[:word]
  end
end
