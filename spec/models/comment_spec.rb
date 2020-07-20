RSpec.describe Comment, type: :model do
  describe 'check validates' do
    context 'with presence' do
      it { is_expected.to validate_presence_of(:body) }
    end
  end

  describe 'with check associations' do
    it { is_expected.to belong_to(:task) }
  end
end
