RSpec.describe ProjectPolicy do
  subject { described_class.new(visitor, project) }

  context 'with user' do
    let(:visitor) { create(:user) }
    let(:project) { create(:project, user: visitor) }

    it { is_expected.to permit_action(:destroy) }
    it { is_expected.to permit_action(:update) }
    it { is_expected.to permit_action(:edit) }
  end

  context 'without user' do
    let(:visitor) { nil }
    let(:project) { create(:project) }

    it { is_expected.to forbid_action(:destroy) }
    it { is_expected.to forbid_action(:update) }
    it { is_expected.to forbid_action(:edit) }
  end

  context 'with not persist user' do
    let(:visitor) { build(:user) }
    let(:project) { create(:project) }

    it { is_expected.to forbid_action(:destroy) }
    it { is_expected.to forbid_action(:update) }
    it { is_expected.to forbid_action(:edit) }
  end
end
