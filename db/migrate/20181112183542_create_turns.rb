class CreateTurns < ActiveRecord::Migration[5.2]
  def change
    create_table :turns do |t|
      t.integer :player1_id
      t.integer :player2_id
      t.belongs_to :challenge, foreign_key: true
      t.integer :winner_id

      t.timestamps
    end
  end
end