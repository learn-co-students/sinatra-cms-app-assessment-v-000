class AddDateColumnToWorkouts < ActiveRecord::Migration
  def change
    add_timestamps(:workouts, null: false)
  end
end
