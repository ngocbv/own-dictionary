require 'rails_helper'

RSpec.describe Example, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:meaning) }
  end
end
