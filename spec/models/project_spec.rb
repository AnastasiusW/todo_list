RSpec.describe Project, type: :model do
  let(:project) { create(:project) }

  it { expect(project).to validate_uniqueness_of(:name).scoped_to(:user_id).with_message(I18n.t('.project_exist')) }
  it { is_expected.to validate_presence_of(:name) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:tasks).dependent(:destroy) }
end
