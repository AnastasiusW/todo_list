FactoryBot.define do
  factory :task do
    name { FFaker::Lorem.word }
    deadline { DateTime.now + 2.day }
    project
  end
end
