class Musician < ActiveRecord::Base
  has_many :reviews
  has_many :venues, through: :reviews
end
