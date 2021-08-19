require 'faker'
require 'factory_bot_rails'

module RoutineHelpers
  def create_routine
    FactoryBot.create(
      :routine,
      # name: Faker::Lorem.words,
      # icon: Faker::Lorem.words,
      # priority: Faker::Number.between(from: 1, to: 9)
      name: 'routines',
      icon: 'routines',
      priority: 4
    )
  end

  def build_routine
    FactoryBot.build(
      :routine,
      # name: Faker::Lorem.words,
      # icon: Faker::Lorem.words,
      # priority: Faker::Number.between(from: 1, to: 9)
      name: 'routines',
      icon: 'routines',
      priority: 4
    )
  end
end
