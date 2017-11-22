class TranslationHistory < ApplicationRecord
 belongs_to :user
 belongs_to :word
end
