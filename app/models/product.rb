
class Product < ActiveRecord::Base
  has_many :client_products
  has_many :clients, :through => :client_products
  has_many :users, :through => :clients

end
