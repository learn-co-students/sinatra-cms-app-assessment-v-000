class Tourist < ActiveRecord::Base
  belongs_to :cruise_ship

  def self.valid_params?(params)
    return !params[:name].empty? && !params[:nationality].empty?
  end
end