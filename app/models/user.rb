class User < ActiveRecord::Base
  has_many :shoes
  has_secure_password

  def slug
    self.username.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slugname)
    self.all.find {|item| item.slug == slugname}
  end

end
