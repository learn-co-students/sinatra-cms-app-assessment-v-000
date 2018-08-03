class ReassignVariableTypeForTitleColumnInUsersTable < ActiveRecord::Migration
  def change
    change_column :users, :title, :text
  end
end
