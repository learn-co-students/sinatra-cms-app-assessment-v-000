class AddUserIdToBgEvents < ActiveRecord::Migration
  def change
    add_column :bg_events, :user_id, :integer
  end
end
