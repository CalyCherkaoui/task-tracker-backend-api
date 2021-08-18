class RemoveQuantityFromTasks < ActiveRecord::Migration[6.0]
  def change
    remove_column :tasks, :quantity, :integer
  end
end
