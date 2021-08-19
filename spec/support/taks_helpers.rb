require 'faker'
require 'factory_bot_rails'
require 'rails_helper'

module TaskHelpers
  def create_task
    FactoryBot.create(
      :task,
      name: Faker::Lorem.words,
      icon: Faker::Lorem.words,
      priority: Faker::Number.between(from: 1, to: 9),
      goal: Faker::Number.number(digits: 3),
      unit: Faker::Lorem.characters(number: 2),
      association :user, factory: :user
      association :routine, factory: :routine
    )
  end

  def build_task
    FactoryBot.build(
      :task,
      name: Faker::Lorem.words,
      icon: Faker::Lorem.words,
      priority: Faker::Number.between(from: 1, to: 9),
      association :user, factory: :user,
      association :routine, factory: :routine,
    )
  end
end
