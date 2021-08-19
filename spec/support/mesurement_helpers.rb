require 'faker'
require 'factory_bot_rails'

module MesurementHelpers
  def create_mesurement(task)
    FactoryBot.create(
      :mesurement,
      quantity: Faker::Number.number(digits: 3),
      task_id: task.id
    )
  end

  def build_mesurement(task)
    FactoryBot.build(
      :mesurement,
      quantity: Faker::Number.number(digits: 3),
      task_id: task.id
    )
  end
end
