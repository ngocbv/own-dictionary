class Antonym < ApplicationRecord
  serialize :content, Array

  belongs_to :word
  belongs_to :meaning
end
