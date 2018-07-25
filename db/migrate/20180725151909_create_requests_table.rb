class CreateRequestsTable < ActiveRecord::Migration
  def change
   create_table :requests do |t|
     t.string :content
     t.integer :user_id
   end
  end
end
