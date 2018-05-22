class CreateSleeplogs < ActiveRecord::Migration[5.2]
  def change
    create_table :sleeplogs do |t|
      t.string :date
      t.string :kind
      t.integer :hours
      t.integer :user_id
    end
  end
end
