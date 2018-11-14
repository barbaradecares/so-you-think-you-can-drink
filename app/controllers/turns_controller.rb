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
           @turn = Turn.create(player1: @@line[0], player2: @@line[1], challenge: Challenge.all.sample)
           @@line.shift(2)
       else
           @turn = Turn.create(player1: Player.find(Turn.last.winner_id), player2: @@line[0], challenge: Challenge.all.sample)
           @@line.shift(1)
       end

       @turn.update(vote_p1: 0, vote_p2: 0)
        redirect_to edit_turn_path(@turn)
   end

   def edit 
        @turn = Turn.find(params[:id])
        @voters = Player.all.select do |p|
            p.id != @turn.player1_id && p.id != @turn.player2_id
        end     
    end 


   def update
        @turn = Turn.find(params[:id])
        @turn.update(turn_params)

        if @turn.vote_p1 + @turn.vote_p2 <= Player.all.count - 2 && @turn.vote_p1 > @turn.vote_p2
            @turn.update(winner_id: @turn.player1_id)
            update_line(@turn)
            update_pts_drinks(@turn)

        elsif @turn.vote_p1 + @turn.vote_p2 <= Player.all.count - 2 && @turn.vote_p2 > @turn.vote_p1
            @turn.update(winner_id: @turn.player2_id)
            update_line(@turn)
            update_pts_drinks(@turn)
 
        end      
        redirect_to edit_turn_path
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
       params.require(:turn).permit(:winner_id, :vote_p1, :vote_p2)
   end
end
