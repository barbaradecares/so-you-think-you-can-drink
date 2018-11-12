class PlayersController < ApplicationController

    def new
        @player = Player.new
        # session[:number_of_players] = params
    end 

    def create 
        @player = Player.create(player_params)
    
        redirects_to welcome
    end 

    def player_params
       params.require(:player).permit(:name, :number_of_wins, :number_of_drinks)
    end

end
