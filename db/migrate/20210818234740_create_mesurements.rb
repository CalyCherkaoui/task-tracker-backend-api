class CreateMesurements < ActiveRecord::Migration[6.0]
  def change
    create_table :mesurements do |t|
      t.integer :quantity
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
