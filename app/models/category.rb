class User < ActiveRecord::Base
  has_many :organizations
end
