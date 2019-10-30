class User < ActiveRecord::Base
  validates :name, uniqueness: true
  has_secure_password
  has_many :sneakers
end
