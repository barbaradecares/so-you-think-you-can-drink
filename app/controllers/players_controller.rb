class PlayersController < ApplicationController

    def new
        @player = Player.new
        # session[:number_of_players] = params
    end

    def create
        @player = Player.create(player_params)
        @player.update(number_of_wins: 0)
        @player.update(number_of_drinks: 0)
        redirect_to new_player_path
    end

    def player_params
       params.require(:player).permit(:name, :number_of_wins, :number_of_drinks)
    end

end
