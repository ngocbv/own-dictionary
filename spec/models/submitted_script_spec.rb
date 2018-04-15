require 'rails_helper'

RSpec.describe SubmittedScript, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:listening_lesson) }
  end
end
