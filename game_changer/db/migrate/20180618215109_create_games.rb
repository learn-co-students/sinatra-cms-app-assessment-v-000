class CreateGames < ActiveRecord::Migration
  def up
    create_table :games do |t|
      t.string :title
      t.integer :user_id
  end
end

def down
  drop_table :games
end
end
