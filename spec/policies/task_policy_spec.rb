RSpec.describe TaskPolicy do
  subject { described_class.new(user, task) }

  context 'with user' do
    let(:user) { create(:user) }
    let(:project) { create(:project, user: user) }
    let(:task) { create(:task, project: project) }

    it { is_expected.to permit_action(:destroy) }
    it { is_expected.to permit_action(:update) }
    it { is_expected.to permit_action(:edit) }
    it { is_expected.to permit_action(:position) }
    it { is_expected.to permit_action(:complete) }
  end

  context 'without user' do
    let(:user) { nil }
    let(:task) { create(:task) }

    it { is_expected.to forbid_action(:destroy) }
    it { is_expected.to forbid_action(:update) }
    it { is_expected.to forbid_action(:edit) }
    it { is_expected.to forbid_action(:position) }
    it { is_expected.to forbid_action(:complete) }
  end
end
