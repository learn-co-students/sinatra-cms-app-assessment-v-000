class User < ActiveRecord::Base
  has_many :sleeplogs
  has_many :energylogs
end
