class Workout < ActiveRecord::Base
    belongs_to :user

    def self.find_by_slug(slug)
        Workout.all.find{|workout| workout.slug == slug}
      end

    def slug
      name.downcase.gsub(" ","-")
    end

end
