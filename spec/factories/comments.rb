FactoryBot.define do
  factory :comment do
    body { FFaker::Book.description(rand(1..2)) }
    file { fixture_file_upload 'spec/support/images/test.jpg', 'image/jpg' }
    task
  end
end
