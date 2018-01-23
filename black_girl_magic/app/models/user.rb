class User < ActiveRecord::Base
  has_secure_password
  has_many :bg_events
end
