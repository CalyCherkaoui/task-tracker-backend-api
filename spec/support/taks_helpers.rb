require 'faker'
require 'factory_bot_rails'

module TaskHelpers

  def create_task(user, routine)
    FactoryBot.create(
      :task,
      name: Faker::Lorem.words,
      priority: Faker::Number.between(from: 1, to: 9),
      routine_id: routine.id,
      user_id: user.id,
      goal: Faker::Number.number(digits: 3),
      unit: Faker::Lorem.characters(number: 2)
    )
  end

  def build_task(user, routine)
    FactoryBot.build(
      :task,
      name: Faker::Lorem.words,
      icon: Faker::Lorem.words,
      priority: Faker::Number.between(from: 1, to: 9),
      routine_id: routine.id,
      user_id: user.id
    )
  end
end
