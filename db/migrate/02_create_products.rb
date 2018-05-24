class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :gender
      t.string :size
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
