require 'rails_helper'

RSpec.describe Meaning, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:word) }
    it { is_expected.to belong_to(:dictionary) }

    it { is_expected.to have_many(:examples).dependent(:destroy) }
    it { is_expected.to have_many(:synonyms).dependent(:destroy) }
    it { is_expected.to have_many(:antonyms).dependent(:destroy) }
  end
end
