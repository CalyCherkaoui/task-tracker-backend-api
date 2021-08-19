require 'faker'
require 'factory_bot_rails'

module MesurementHelpers
  def create_mesurement
    FactoryBot.create(
      :mesurement,
      quantity: Faker::Number.number(digits: 3)
    )
  end

  def build_mesurement
    FactoryBot.build(
      :mesurement,
      quantity: Faker::Number.number(digits: 3),
    )
  end
end