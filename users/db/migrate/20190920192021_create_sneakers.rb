class CreateSneakers < ActiveRecord::Migration
  def change
    create_table :sneakers do |t|
      t.string :name
      t.integer :year
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
