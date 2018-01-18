class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :musician_id
      t.integer :venue_id
    end
  end
end
