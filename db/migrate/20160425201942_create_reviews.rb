class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :reviews
    end
  end
end
