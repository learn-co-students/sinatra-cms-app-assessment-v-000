class Game < ActiveRecord::Base
  has_many :teams
  has_many :players, through: :teams
  has_many :goals
end

# player player player

# team team 

# game

# goal goal goal