class AddPhotoColumnToWorkouts < ActiveRecord::Migration
  def change
    def up
        add_column :workouts, :photo, :string
      end

      def down
        remove_column :workouts, :photo
      end
  end
end
