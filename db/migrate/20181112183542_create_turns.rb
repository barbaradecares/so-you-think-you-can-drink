class CreateTurns < ActiveRecord::Migration[5.2]
  def change
    create_table :turns do |t|
      t.belongs_to :player1, :class_name => “Player”, :foreign_key => player1_id
      t.belongs_to :player2, :class_name => “Player”, :foreign_key => player2_id
      t.belongs_to :challenge, foreign_key: true
      t.integer :winner_id

      t.timestamps
    end
  end
end