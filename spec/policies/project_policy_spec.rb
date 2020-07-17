RSpec.describe ProjectPolicy do
  subject { described_class.new(user, project) }

  context 'with user' do
    let(:user) { create(:user) }
    let(:project) { create(:project, user: user) }

    it { is_expected.to permit_action(:destroy) }
    it { is_expected.to permit_action(:update) }
    it { is_expected.to permit_action(:edit) }
  end

  context 'without user' do
    let(:user) { nil }
    let(:project) { create(:project) }

    it { is_expected.to forbid_action(:destroy) }
    it { is_expected.to forbid_action(:update) }
    it { is_expected.to forbid_action(:edit) }
  end
end
