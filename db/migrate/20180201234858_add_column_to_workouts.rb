class AddColumnToWorkouts < ActiveRecord::Migration
  def up
      add_column :workouts, :website, :string
    end

    def down
      remove_column :workouts, :website
    end
end
