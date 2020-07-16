require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'check validates' do
    context 'with presence' do
      it { is_expected.to validate_presence_of(:name) }
    end
  end

  describe 'with check associations' do
    it { is_expected.to belong_to(:project) }
  end
end
