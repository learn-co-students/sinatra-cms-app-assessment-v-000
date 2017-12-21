class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.string :name
      t.string :color
      t.string :brand
      t.integer :user_id
    end
  end
end
