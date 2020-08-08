RSpec.describe TaskPolicy do
  subject { described_class.new(visitor, task) }

  let(:scope) { described_class::Scope.new(visitor, Task.all).resolve }

  context 'with user' do
    let(:visitor) { create(:user) }
    let(:project) { create(:project, user: visitor) }

    context 'with one task' do
      let(:task) { create(:task, project: project) }

      it { is_expected.to permit_action(:destroy) }
      it { is_expected.to permit_action(:update) }
      it { is_expected.to permit_action(:edit) }
      it { is_expected.to permit_action(:position) }
      it { is_expected.to permit_action(:complete) }
      it { is_expected.to permit_action(:show) }
      it { is_expected.to permit_action(:create) }
    end

    context 'with list tasks' do
      let(:task1) { create(:task, project: project) }
      let(:task2) { create(:task) }

      it { expect(scope).to include(task1) }
      it { expect(scope).not_to include(task2) }
    end
  end

  context 'without user' do
    let(:visitor) { nil }

    context 'with one task' do
      let(:task) { create(:task) }

      it { is_expected.to forbid_action(:destroy) }
      it { is_expected.to forbid_action(:update) }
      it { is_expected.to forbid_action(:edit) }
      it { is_expected.to forbid_action(:position) }
      it { is_expected.to forbid_action(:complete) }
      it { is_expected.to forbid_action(:show) }
      it { is_expected.to forbid_action(:create) }
    end

    context 'with list tasks' do
      let(:task1) { create(:task) }
      let(:task2) { create(:task) }

      it { expect(scope).not_to include(task1) }
    end
  end

  context 'with not persist user' do
    let(:visitor) { build(:user) }

    context 'with one task' do
      let(:task) { create(:task) }

      it { is_expected.to forbid_action(:destroy) }
      it { is_expected.to forbid_action(:update) }
      it { is_expected.to forbid_action(:edit) }
      it { is_expected.to forbid_action(:position) }
      it { is_expected.to forbid_action(:complete) }
      it { is_expected.to forbid_action(:show) }
      it { is_expected.to forbid_action(:create) }
    end

    context 'with list tasks' do
      let(:task1) { create(:task) }
      let(:task2) { create(:task) }

      it { expect(scope).not_to include(task1) }
    end
  end
end
