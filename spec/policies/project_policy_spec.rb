RSpec.describe ProjectPolicy do
  subject { described_class.new(visitor, project) }

  context 'with user' do
    let(:visitor) { create(:user) }

    context 'with one project' do
      let(:project) { create(:project, user: visitor) }

      it { is_expected.to permit_action(:destroy) }
      it { is_expected.to permit_action(:update) }
      it { is_expected.to permit_action(:edit) }
      it { is_expected.to permit_action(:show) }
      it { is_expected.to permit_action(:create) }
    end

    context 'with list projects' do
      let(:project) { create_list(:project, 2, user: visitor) }

      it { is_expected.to permit_action(:index) }
    end
  end

  context 'without user' do
    let(:visitor) { nil }

    context 'with one project' do
      let(:project) { create(:project) }

      it { is_expected.to forbid_action(:destroy) }
      it { is_expected.to forbid_action(:update) }
      it { is_expected.to forbid_action(:edit) }
      it { is_expected.to forbid_action(:show) }
      it { is_expected.to forbid_action(:create) }
    end

    context 'with list  project' do
      let(:project) { create_list(:project, 2) }

      it { is_expected.to forbid_action(:index) }
    end
  end

  context 'with not persist user' do
    let(:visitor) { build(:user) }

    context 'with one project' do
      let(:project) { create(:project) }

      it { is_expected.to forbid_action(:destroy) }
      it { is_expected.to forbid_action(:update) }
      it { is_expected.to forbid_action(:edit) }
      it { is_expected.to forbid_action(:show) }
      it { is_expected.to forbid_action(:create) }
    end

    context 'with list  project' do
      let(:project) { create_list(:project, 2) }

      it { is_expected.to forbid_action(:index) }
    end
  end
end
