RSpec.describe Comment, type: :model do
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_length_of(:body).is_at_least(10).is_at_most(256) }
  it { is_expected.to belong_to(:task) }
end
