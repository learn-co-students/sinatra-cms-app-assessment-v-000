class Workout < ActiveRecord::Base
    belongs_to :user
  def assign_photo(training_type)
    if training_type== "HIIT"
        "/images/HIIT-Logo.gif"
      elsif training_type== "Strength Training"
        "/images/weight-lifting-1297690_960_720.png"
      elsif training_type== "Pilates"
        "/images/6609676_orig.png"
      elsif training_type== "Cardio"
        "/images/logo-cardio.jpg"
      elsif training_type== "Yoga"
        "/images/yoga-transparent.png"
      elsif training_type== "Low Impact"
        "/images/lowimpact-logo.png"
      else
        "/images/boxing-kickboxing-logo.png"
    end
  end
end
