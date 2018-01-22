class RenameEventsTable < ActiveRecord::Migration
  def change
    rename_table :events, :bgevents
  end
end
