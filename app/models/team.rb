class Team <ActiveRecord::Base
  belongs_to :user
  has_many :players

  def self.valid_params?(params)
    return !params[:name].empty? && !params[:league].empty?
  end

end
