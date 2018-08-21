class Organization < ActiveRecord::Base

  belongs_to :user
  belongs_to :category


  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    User.all.find{|user| user.slug == slug}
  end

end
