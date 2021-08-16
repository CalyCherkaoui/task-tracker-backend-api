class RemoveExpiredAtFromJwtDenylist < ActiveRecord::Migration[6.0]
  def change
    remove_column :jwt_denylist, :expired_at, :datetime
  end
end
