class RenameEventsTable < ActiveRecord::Migration
  def change
    rename_table :events, :bg_events
  end
end
