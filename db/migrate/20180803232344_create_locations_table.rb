class CreateLocationsTable < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :county_id
      t.text :city
      t.text :zip
      t.text :locality
    end
  end
end
