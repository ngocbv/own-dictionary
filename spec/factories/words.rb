FactoryBot.define do
  factory :word do
    name { Faker::Lorem.word }
    updated true
  end
end
