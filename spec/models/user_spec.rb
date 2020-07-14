require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'check validates' do
    context 'with presence' do
      it { is_expected.to validate_presence_of(:user_name) }
      it { is_expected.to validate_presence_of(:password) }
    end

    context 'with length' do
      it { is_expected.to validate_length_of(:user_name).is_at_least(3).is_at_most(50) }
      it { is_expected.to validate_length_of(:password).is_at_least(8) }
    end

    context 'with uniqueness' do
      let(:user) { build(:user) }

      it { expect(user).to validate_uniqueness_of(:user_name) }
    end
  end

  describe 'with check associations' do
    it { is_expected.to have_many(:projects).dependent(:destroy) }
  end
end
