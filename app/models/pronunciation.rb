class Pronunciation < ApplicationRecord
  serialize :dialects, Array

  belongs_to :word
end
