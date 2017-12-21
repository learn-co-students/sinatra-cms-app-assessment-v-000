class Player <ActiveRecord::Base
  belongs_to :team

  def self.valid_params?(params)
    params.each do |player|
      if player[:name].empty? || player[:position].empty? || player[:price].empty?
        return FALSE
      end
    end
    return TRUE
  end

end
