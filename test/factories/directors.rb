FactoryBot.define do
  factory :director do
    name { Faker::Name.full_name }
    age { rand(100) }
  end
end