require 'rails_helper'

RSpec.describe Pronunciation, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:word) }
  end
end
