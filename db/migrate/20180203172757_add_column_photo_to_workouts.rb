class AddColumnPhotoToWorkouts < ActiveRecord::Migration
  def up
      add_column :workouts, :photo, :string
    end

    def down
      remove_column :workouts, :photo
    end
end
