RSpec.describe CommentPolicy do
  subject(:comment_policy) { described_class.new(visitor, comment) }

  context 'with user' do
    let(:visitor) { create(:user) }
    let(:project) { create(:project, user: visitor) }
    let(:task) { create(:task, project: project) }
    let(:comment) { create(:comment, task: task) }

    it { is_expected.to permit_action(:destroy) }
  end

  context 'without user' do
    let(:visitor) { nil }
    let(:comment) { create(:comment) }

    it { is_expected.to forbid_action(:destroy) }
  end

  context 'with not persist user' do
    let(:visitor) { build(:user) }
    let(:comment) { create(:comment) }

    it { is_expected.to forbid_action(:destroy) }
  end
end
