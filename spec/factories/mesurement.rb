FactoryBot.define do
  factory :mesurement do
    # disable empty block rubocop error
    association :task, factory: :task
  end
end
