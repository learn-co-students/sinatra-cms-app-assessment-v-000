class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |col|
      col.integer :minute
      col.integer :game_id
      col.integer :player_id
      col.integer :team_id
    end
  end
end
