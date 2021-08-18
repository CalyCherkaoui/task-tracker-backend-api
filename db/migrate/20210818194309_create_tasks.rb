class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :priority
      t.integer :quantity
      t.integer :goal
      t.references :routine, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :unit

      t.timestamps
    end
  end
end
