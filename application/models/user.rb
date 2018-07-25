class User < ActiveRecord::Base
  has_many :recommendations
  has_many :requests
  has_secure_password
end
