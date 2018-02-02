class User < ActiveRecord::Base
  has_secure_password
<<<<<<< HEAD
  has_many :workouts

  def self.find_by_slug(slug)
      User.all.find{|user| user.slug == slug}
    end

  def slug
    username.downcase.gsub(" ","-")
  end

=======
  has_many :golf_bags
>>>>>>> 3fa39cf7bcb96c9b5487dd8830c5f6ecae00750c
end
