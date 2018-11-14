class AddVotingToTurn < ActiveRecord::Migration[5.2]
  def change
    add_column :turns, :vote_p1, :integer
    add_column :turns, :vote_p2, :integer
  end
end
