class Venue < ActiveRecord::Base
  has_many :reviews
  has_many :musicians, through: :reviews
end
