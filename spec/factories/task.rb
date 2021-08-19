FactoryBot.define do
  factory :task do
    # disable empty block rubocop error
    # name { Faker::Lorem.words }
    # priority { Faker::Number.between(from: 1, to: 9) }
    # goal { Faker::Number.number(digits: 3) }
    # unit { Faker::Lorem.characters(number: 2) }
    association :routine, factory: :routine
    association :user, factory: :user
  end
end
