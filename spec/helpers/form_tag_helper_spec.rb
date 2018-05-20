require 'rails_helper'

RSpec.describe FormTagHelper, type: :helper do
  describe '#utf8_enforcer_tag' do
    subject { helper.utf8_enforcer_tag }

    it { is_expected.to eq '' }
  end
end
