class Turn < ApplicationRecord
   belongs_to :challenge
   belongs_to :player1, foreign_key: :player1_id, class_name: "Player"
   belongs_to :player2, foreign_key: :player2_id, class_name: "Player"
end
