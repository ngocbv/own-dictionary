class Word < ApplicationRecord
  has_one :pronunciation
  has_many :meanings
  has_many :examples, through: :meanings

  validates :name, presence: true
end
