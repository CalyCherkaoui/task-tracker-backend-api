class CreateRoutines < ActiveRecord::Migration[6.0]
  def change
    create_table :routines do |t|
      t.string :name
      t.string :icon
      t.integer :priority

      t.timestamps
    end
  end
end
