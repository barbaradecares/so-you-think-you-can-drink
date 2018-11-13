class TurnsController < ApplicationController
    before_action :define_current_turn

    def define_current_turn
        if Turn.all.empty?
            create_line
            @turn = Turn.create(player1: @@line[0], player2: @@line[1], challenge: Challenge.all.sample)
            @@line.shift(2)
        else 
            @turn = Turn.create(player1: Turn.last.winner_id, player2: @@line[0], challenge: Challenge.all.sample)
            @@line.shift(2)
        end 
    end 

    def update 
        @turn = Turn.find(params[:id])
        @turn.update(winner_id: define_winner)

        if @turn.player1_id == @turn.winner_id
            @@line << @turn.player2
        else 
            @@line << @turn.player1
        end 
    end 

    def define_winner

    end 

    def create_line
        @@line = []
        Player.all.each do |p|
            @@line << p
        end
    end
end
