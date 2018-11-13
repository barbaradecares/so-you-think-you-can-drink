class TurnsController < ApplicationController
    before_action :define_current_turn

    def define_current_turn
        if Turn.all.empty?
            create_line
            @turn = Turn.create(player1: @@line[0], player2: @@line[1], challenge: Challenge.all.sample)
            @@line.drop(2)
        else 
            @turn = Turn.create(player2: @@line[0], challenge: Challenge.all.sample)
            @@line.drop(2)
        end 
    end 


    def create_line
        @@line = []
        Player.all.each do |p|
            @@line << p
        end
    end
    
    def define_previous_turn(turn)
        Turn.find(turn.id - 1)
    end 

    def find_winner
        Turn.find(@turn.id - 1).winner_id
    end 


    
end
