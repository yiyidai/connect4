class AddWinnerToPlayer < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :winner, :boolean
  end
end
