class Player < ApplicationRecord
    @@line = []

    validates :name, presence: true, uniqueness: true

#    def self.line(player)
#         @@line << player
#    end
end
