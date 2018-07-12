class User < ActiveRecord::Base
  has_many :games
  has_secure_password
  validates :username, presence: true

  def slug
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    User.all.find{|usrnm| usrnm.slug == slug}
  end


end
