class Meaning < ApplicationRecord
  belongs_to :word
  belongs_to :dictionary

  has_many :examples
end
