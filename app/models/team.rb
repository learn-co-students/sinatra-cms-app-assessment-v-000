class Team < ActiveRecord::Base
  has_many :players
  has_many :games
  has_many :goals, through: :games
end

# player player player

# team team 

# game

# goal goal goal