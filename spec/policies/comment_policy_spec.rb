RSpec.describe CommentPolicy do
  subject(:comment_policy) { described_class.new(visitor, comment) }

  context 'with user' do
    let(:visitor) { create(:user) }
    let(:project) { create(:project, user: visitor) }
    let(:task) { create(:task, project: project) }

    context 'with one comment' do
      let(:comment) { create(:comment, task: task) }

      it { is_expected.to permit_action(:destroy) }
      it { is_expected.to permit_action(:create) }
    end

    context 'with list comments' do
      let(:comment) { create_list(:comment, 2, task: task) }

      it { is_expected.to permit_action(:index) }
    end
  end

  context 'without user' do
    let(:visitor) { nil }

    context 'with one comment' do
      let(:comment) { create(:comment) }

      it { is_expected.to forbid_action(:destroy) }
      it { is_expected.to forbid_action(:create) }
    end

    context 'with list comments' do
      let(:comment) { create_list(:comment, 2) }

      it { is_expected.to forbid_action(:index) }
    end
  end

  context 'with not persist user' do
    let(:visitor) { build(:user) }

    context 'with one comment' do
      let(:comment) { create(:comment) }

      it { is_expected.to forbid_action(:destroy) }
      it { is_expected.to forbid_action(:create) }
    end

    context 'with list comments' do
      let(:comment) { create_list(:comment, 2) }

      it { is_expected.to forbid_action(:index) }
    end
  end
end
