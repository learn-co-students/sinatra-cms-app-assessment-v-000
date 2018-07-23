class User < ActiveRecord::Base
  has_many :recommendations
  has_many :requests
end
