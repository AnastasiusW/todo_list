FactoryBot.define do
  factory :user do
    user_name { "#{FFaker::Name.first_name} #{FFaker::Name.last_name}" }
    password { FFaker::Internet.password }
  end
end
