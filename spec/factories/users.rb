FactoryBot.define do
  factory :user do
    user_name { FFaker::Internet.unique.user_name }
    password { FFaker::Internet.password  }
  end
end
