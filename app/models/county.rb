class County < ActiveRecord::Base
  has_many :locations
end
