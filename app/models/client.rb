
class Client < ActiveRecord::Base
  validates :aka_name, presence: true
  belongs_to :user
  has_many :client_products
  has_many :products, :through => :client_products


  # def find_client
  #   Client.find(params[:id])
  # end
end
