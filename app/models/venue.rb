class Venue < ActiveRecord::Base
  include Slug::InstanceMethods
  extend Slug::ClassMethods

  has_many :reviews
  has_many :musicians, through: :reviews
end
