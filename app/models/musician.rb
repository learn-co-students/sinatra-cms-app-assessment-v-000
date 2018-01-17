class Musician < ActiveRecord::Base
  include Slug::InstanceMethods
  extend Slug::ClassMethods

  has_many :reviews
  has_many :venues, through: :reviews
end
