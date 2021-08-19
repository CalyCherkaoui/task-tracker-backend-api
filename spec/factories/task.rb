FactoryBot.define do
  factory :task do
    # disable empty block rubocop error
    association :user, factory: :user
    association :routine, factory: :routine,
  end
end
