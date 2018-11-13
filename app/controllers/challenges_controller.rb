class ChallengesController < ApplicationController
    def new
        @challenges = Challenge.all
        @challenge = Challenge.new
    end

    def index
        @challenges = Challenge.all
    end

    def create
        Challenge.create(challenge_params)
        redirect_to new_challenge_path
    end

    def challenge_params
        params.require(:challenge).permit(:video_url, :drinks, :title, :description)
    end
end
