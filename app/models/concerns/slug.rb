module Slug
  module InstanceMethods
    def slug
      array = self.username.split(" ")
      array = array.join("-").downcase
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      slug = slug.split("-")
      slug = slug.join(" ")
      self.all.find_by(username: slug)
    end
  end
end
