class Shoe < ActiveRecord::Base
  belongs_to :user

  def slug
    self.name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slugname)
    self.all.find {|item| item.slug == slugname}
  end

end
