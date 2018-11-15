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
        @votes = @turn.vote_p1 + @turn.vote_p2 
    end 


   def update
        @turn = Turn.find(params[:id])
        
        update_pts_drinks(@turn)

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
        if turn_params[:vote_p1]
            turn.update(vote_p1: turn_params[:vote_p1])
            
        elsif turn_params[:vote_p2]  
            turn.update(vote_p2: turn_params[:vote_p2])
        end 

        voters = Player.all.length - 2
        votes = turn.vote_p1 + turn.vote_p2
         
        if voters <= votes 
            if turn.vote_p1 > turn.vote_p2
                turn.player1.update(number_of_wins: turn.player1.number_of_wins + 1)
                turn.player2.update(number_of_drinks: turn.player2.number_of_drinks + turn.challenge.drinks)
                turn.update(winner_id: turn.player1_id)
                update_line(turn)

            elsif turn.vote_p2 > turn.vote_p1
                turn.player2.update(number_of_wins: turn.player2.number_of_wins + 1)
                turn.player1.update(number_of_drinks: turn.player1.number_of_drinks + turn.challenge.drinks)
                turn.update(winner_id: turn.player2_id)
                update_line(turn)
            end 
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
       params.require(:turn).permit(:vote_p1, :vote_p2)
   end
end
