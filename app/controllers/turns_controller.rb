class TurnsController < ApplicationController

   def index
       @players_wins = Player.all.order(number_of_wins: :desc)
       @players_drinks = Player.all.order(number_of_drinks: :desc)
       @final_winners = Player.all.select{|p| p.number_of_wins == @players_wins.first.number_of_wins }
       @final_drinkers = Player.all.select{|p| p.number_of_drinks == @players_drinks.first.number_of_drinks }
   end

   def new
       if Turn.all.empty?
           create_line
           @player1 = @@line[0]
           @player2 = @@line[1]
           @challenge = Challenge.all.sample
       else
           @player1 = Player.find(Turn.last.winner_id)
           @player2 = @@line[0]
           @challenge = Challenge.all.sample
       end
   end

   def create
       if Turn.all.empty?
           @turn = Turn.create(player1: @@line[0], player2: @@line[1], challenge: Challenge.all.sample, winner_id: turn_params[:winner_id])
           @@line.shift(2)
       else
           @turn = Turn.create(player1: Player.find(Turn.last.winner_id), player2: @@line[0], challenge: Challenge.all.sample, winner_id: turn_params[:winner_id])
           @@line.shift(1)
       end
       update_line(@turn)
       update_pts_drinks(@turn)
       redirect_to turn_path(@turn)
   end

   def show
       @turn = Turn.find(params[:id])
       if @turn.player1_id == @turn.winner_id
           @winner = @turn.player1
           @loser = @turn.player2
       else
           @winner = @turn.player2
           @loser = @turn.player1
       end

       @ranking = Player.all.order(number_of_wins: :desc)
   end


        @ranking = Player.all.order(number_of_wins: :desc)
    end
    def update_pts_drinks(turn)
        p1 = turn.player1
        p2 = turn.player2
        if turn.winner_id == p1.id
            p1.update(number_of_wins: p1.number_of_wins + 1)
            p2.update(number_of_drinks: p2.number_of_drinks + turn.challenge.drinks)
        else
            p2.update(number_of_wins: p2.number_of_wins + 1)
            p1.update(number_of_drinks: p1.number_of_drinks + turn.challenge.drinks)
        end
    end

   def update_line(turn)
       if turn.player1_id == turn.winner_id
           @@line << turn.player2
       else
           @@line << turn.player1
       end
   end

   def create_line
       @@line = []
       Player.all.each do |p|
           @@line << p
       end
   end

   def turn_params
       params.require(:turn).permit(:winner_id)
   end
end
