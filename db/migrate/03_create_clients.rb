class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :aka_name
      t.string :age
      t.string :gender
      t.string :need
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
