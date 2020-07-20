RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  include ActionDispatch::TestProcess
end
