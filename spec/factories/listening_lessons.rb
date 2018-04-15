FactoryBot.define do
  factory :listening_lesson do
    name { Faker::Lorem.word }
    link { Faker::Internet.url }
    script { Faker::Lorem.sentence }
  end
end
