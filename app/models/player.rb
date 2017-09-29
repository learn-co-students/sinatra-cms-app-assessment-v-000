class Player < ActiveRecord::Base
  belongs_to :team
  has_many :games, through: :teams
  has_many :goals, through: :games
end

# player player player

# team team 

# game

# goal goal goal