class CreateEnergylogs < ActiveRecord::Migration[5.2]
  def change
    create_table :energylogs do |t|
      t.string :date
      t.integer :rating
      t.integer :user_id
    end
  end
end
