class Users < ActiveRecord::Base
  has_many :recommendations
end
