class Turn < ApplicationRecord
  belongs_to :player
  belongs_to :challenge
end
