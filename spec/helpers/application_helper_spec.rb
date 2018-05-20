require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#gravatar_for' do
    let(:user) { create :user }
    subject { helper.gravatar_for user, options }
    let(:hexa_email) { 'hexa_email' }

    before do
      expect(Digest::MD5).to receive(:hexdigest).with(user.email.downcase).and_return hexa_email
    end

    context 'without options' do
      let(:options) { {} }
      let(:expected_result) {
        "<img alt=\"\" class=\"gravatar\" src=\"http://secure.gravatar.com/avatar/#{hexa_email}?s=\" />"
      }

      it { is_expected.to eq expected_result }
    end

    context 'with avatar size opitions' do
      let(:options) { { size: 100 } }
      let(:expected_result) {
        "<img alt=\"\" class=\"gravatar\" src=\"http://secure.gravatar.com/avatar/#{hexa_email}?s=100\" />"
      }

      it { is_expected.to eq expected_result }
    end
  end
end
