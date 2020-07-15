require 'dox'
Dir[Rails.root.join('spec/docs/**/*.rb')].each { |file| require file }

RSpec.configure do |config|
  config.after(:each, :dox) do |example|
    example.metadata[:request] = request
    example.metadata[:response] = response
  end
end

Dox.configure do |config|
  config.header_file_path = Rails.root.join('spec/docs/v1/descriptions/header.md')
  config.desc_folder_path = Rails.root.join('spec/docs/v1/descriptions')
  config.headers_whitelist = %w[Accept X-Auth-Token Authorization]
end
