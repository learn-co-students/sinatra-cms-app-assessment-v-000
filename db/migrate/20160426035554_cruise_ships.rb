class CruiseShips < ActiveRecord::Migration
  def change
    create_table :cruise_ships do |t|
      t.string :name
      t.integer :capacity
      t.integer :user_id
    end
  end
end
