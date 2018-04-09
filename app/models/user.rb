class User < ActiveRecord::Base
  has_many :clients
  has_many :products, :through => :clients
  has_secure_password
  validates_presence_of :first_name, :last_name, :username, :email, :password, :on => :create
  validates_uniqueness_of :email

  # def find_user
  #   User.find(params[:id])
  # end

end
