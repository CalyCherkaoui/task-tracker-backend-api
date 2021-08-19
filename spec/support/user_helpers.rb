require 'faker'
require 'factory_bot_rails'

module UserHelpers
  def create_user
    FactoryBot.create(
      :user,
      username: Faker::Internet.username,
      email: Faker::Internet.email,
      # password: Faker::Internet.password
      password: 123_456_789
    )
  end

  def build_user
    FactoryBot.build(
      :user,
      username: Faker::Internet.username,
      email: Faker::Internet.email,
      # password: Faker::Internet.password
      password: 123_456_789
    )
  end
end
