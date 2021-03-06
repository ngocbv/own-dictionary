require 'rails_helper'

RSpec.describe Antonym, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:word) }
    it { is_expected.to belong_to(:meaning) }
  end
end
