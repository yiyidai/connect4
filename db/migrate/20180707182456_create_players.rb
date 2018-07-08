class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.boolean :active
      t.integer :winTimes

      t.timestamps
    end
  end
end
