class AddColumnTeamId < ActiveRecord::Migration
  def change
    add_column :players, :team_id, :integer
  end
end
