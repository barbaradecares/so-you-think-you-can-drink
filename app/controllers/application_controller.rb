class ApplicationController < ActionController::Base

    def index
        Turn.destroy_all
        Player.destroy_all
    end

end
