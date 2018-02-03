class Workout < ActiveRecord::Base
    belongs_to :user
def assign_photo
  case @workout
    when "HIIT"
      "/images/HIIT-Logo.gif"

    when "Strength Training"
      "/images/weight-lifting-1297690_960_720.png"

    when "Pilates"
      "/images/6609676_orig.png"

    when "Cardio"
      "/images/logo-cardio.jpg"

    when "Yoga"
      "/images/yoga-transparent.png"

    when "Low Impact"
      "/images/lowimpact-logo.png"

    when "Kickboxing"
      "/images/boxing-kickboxing-logo.png"
    end

  end
end
