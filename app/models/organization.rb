class Organization < ActiveRecord::Base

  belongs_to :user
  belongs_to :category

  def account_rank
    case self.account
    when "General"
      6
    when "Colonel"
      5
    when "Major"
      4
    when "Captain"
      3
    when "Lieutenant"
      2
    else
      1
    end
  end

  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    User.all.find{|user| user.slug == slug}
  end

end
