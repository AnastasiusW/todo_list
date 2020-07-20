RSpec.describe CommentPolicy do
  subject { described_class.new(user, comment) }

  context 'with user' do
    let(:user) { create(:user) }
    let(:project) { create(:project, user: user) }
    let(:task) { create(:task, project: project) }
    let(:comment) { create(:comment, task: task) }

    it { is_expected.to permit_action(:destroy) }
  end

  context 'without user' do
    let(:user) { nil }
    let(:comment) { create(:comment) }

    it { is_expected.to forbid_action(:destroy) }
  end
end
