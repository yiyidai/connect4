class CreateNodes < ActiveRecord::Migration[5.2]
  def change
    create_table :nodes do |t|
      t.integer :rowNumber
      t.integer :columnNumber
      t.string :belongsTo

      t.timestamps
    end
  end
end
