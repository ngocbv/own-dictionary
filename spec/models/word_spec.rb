require 'rails_helper'

RSpec.describe Word, type: :model do
  describe 'associations' do
    it { is_expected.to have_one(:pronunciation).dependent(:destroy) }
    it { is_expected.to have_many(:meanings).dependent(:destroy) }
    it { is_expected.to have_many(:examples) }
    it { is_expected.to have_many(:synonyms) }
    it { is_expected.to have_many(:antonyms) }
    it { is_expected.to have_many(:translation_histories).dependent(:destroy) }
  end
end
