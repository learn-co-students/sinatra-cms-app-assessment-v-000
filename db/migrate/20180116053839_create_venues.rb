class CreateVenues < ActiveRecord::Migration[5.1]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :location
      t.string :review
      t.boolean :positive
      t.integer :musician_id
    end
  end
end
