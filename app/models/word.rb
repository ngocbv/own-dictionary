class Word < ApplicationRecord
  has_one :pronunciation, dependent: :destroy
  has_many :meanings, dependent: :destroy
  has_many :examples, through: :meanings
  has_many :synonyms
  has_many :antonyms
  has_many :translation_histories, dependent: :destroy

  validates :name, presence: true
end
