class TurnsController < ApplicationController
    before_action :define_current_turn

    def define_current_turn
        if Turn.all.empty?
            @turn = Turn.create(player1: Player.first, player2: Player.second, challenge: Challenge.all.sample)
        else 
            
        end 
    end 

    def find_winner
        Turn.find(@turn.id - 1).winner_id
    end 


    
end
