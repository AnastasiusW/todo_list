RSpec.describe ProjectPolicy do
  subject { described_class.new(visitor, project) }

  let(:scope) { described_class::Scope.new(visitor, Project.all).resolve }

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
      let(:project1) { create(:project, user: visitor) }
      let(:project2) { create(:project) }

      it { expect(scope).to include(project1) }
      it { expect(scope).not_to include(project2) }
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
      let(:project1) { create(:project) }
      let(:project2) { create(:project) }

      it { expect(scope).not_to include(project1) }
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
      let(:project1) { create(:project) }
      let(:project2) { create(:project) }

      it { expect(scope).not_to include(project1) }
    end
  end
end
