class DropCountiesTable < ActiveRecord::Migration
  def change
    drop_table :counties
  end
end
