class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :number_of_wins
      t.integer :number_of_drinks

      t.timestamps
    end
  end
end
