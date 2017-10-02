class Dictionary < ApplicationRecord
  validates :name, uniqueness: true
end
