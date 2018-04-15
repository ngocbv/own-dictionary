require 'rails_helper'

RSpec.describe Dictionary, type: :model do
  describe 'validations' do
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
