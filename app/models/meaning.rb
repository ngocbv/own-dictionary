class Meaning < ApplicationRecord
  belongs_to :word
  belongs_to :dictionary

  has_many :examples, dependent: :destroy
  has_many :synonyms, dependent: :destroy
  has_many :antonyms, dependent: :destroy
end
