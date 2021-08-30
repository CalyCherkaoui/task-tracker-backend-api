class AddAdmin < ActiveRecord::Migration[6.0]
  def change
    User.create! do |u|
      u.username = 'admin'
      u.email = 'admin@test.com'
      u.password = '123456789'
      u.admin = true
    end
  end
end
