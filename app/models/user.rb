class User < ActiveRecord::Base
  has_secure_password
  has_many :workouts

  def self.find_by_slug(slug)
      User.all.find{|user| user.slug == slug}
    end

  def slug
    username.downcase.gsub(" ","-")
  end

end
