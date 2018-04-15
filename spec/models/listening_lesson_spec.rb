require 'rails_helper'

RSpec.describe ListeningLesson, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:submitted_scripts) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:link) }
  end

  describe '#script_submitted_by?' do
    subject { create :listening_lesson }
    let(:user) { create :user }

    context 'user with no submitted script' do
      it 'returns false' do
        expect(subject.script_submitted_by? user).to eq false
      end
    end

    context 'user with a submitted script' do
      let!(:script) { create :submitted_script, listening_lesson: subject, user: user }

      it 'returns true' do
        expect(subject.reload.script_submitted_by? user).to eq true
      end
    end
  end
end
