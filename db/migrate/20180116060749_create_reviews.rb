class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :review
      t.boolean :experience
      t.integer :musician_id
      t.integer :venue_id
    end
  end
end
