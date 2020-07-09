require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'check validates' do
    context 'with presence' do
      it { is_expected.to validate_presence_of(:name) }
    end
  end
  describe 'with check associations' do

      it { is_expected.to belong_to(:user) }
    end

end
