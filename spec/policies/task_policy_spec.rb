RSpec.describe TaskPolicy do
  subject { described_class.new(visitor, task) }

  context 'with user' do
    let(:visitor) { create(:user) }
    let(:project) { create(:project, user: visitor) }
    let(:task) { create(:task, project: project) }

    it { is_expected.to permit_action(:destroy) }
    it { is_expected.to permit_action(:update) }
    it { is_expected.to permit_action(:edit) }
    it { is_expected.to permit_action(:position) }
    it { is_expected.to permit_action(:complete) }
    it { is_expected.to permit_action(:show) }
    it { is_expected.to forbid_action(:index) }
    it { is_expected.to forbid_action(:create) }
  end

  context 'without user' do
    let(:visitor) { nil }

    let(:task) { create(:task) }

    it { is_expected.to forbid_action(:destroy) }
    it { is_expected.to forbid_action(:update) }
    it { is_expected.to forbid_action(:edit) }
    it { is_expected.to forbid_action(:position) }
    it { is_expected.to forbid_action(:complete) }
    it { is_expected.to forbid_action(:show) }
    it { is_expected.to forbid_action(:index) }
    it { is_expected.to forbid_action(:create) }
  end

  context 'with not persist user' do
    let(:visitor) { build(:user) }
    let(:task) { create(:task) }

    it { is_expected.to forbid_action(:destroy) }
    it { is_expected.to forbid_action(:update) }
    it { is_expected.to forbid_action(:edit) }
    it { is_expected.to forbid_action(:position) }
    it { is_expected.to forbid_action(:complete) }
    it { is_expected.to forbid_action(:show) }
    it { is_expected.to forbid_action(:index) }
    it { is_expected.to forbid_action(:create) }
  end
end
