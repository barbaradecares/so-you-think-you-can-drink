class CreateTurns < ActiveRecord::Migration[5.2]
  def change
    create_table :turns do |t|
      t.belongs_to :player, foreign_key: true
      t.belongs_to :challenge, foreign_key: true
      t.boolean :win
      t.integer :game

      t.timestamps
    end
  end
end
