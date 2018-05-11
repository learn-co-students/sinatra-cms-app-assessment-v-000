class User < ActiveRecord::Base
  has_secure_password
  has_many :sleeplogs
  has_many :energylogs
end
