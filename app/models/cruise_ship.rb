class CruiseShip < ActiveRecord::Base
  has_many :tourists
  belongs_to :user

  def self.valid_params?(params)
    return !params[:name].empty? && !params[:capacity].empty?
  end
end