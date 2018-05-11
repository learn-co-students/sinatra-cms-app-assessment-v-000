class CreateEnergylogs < ActiveRecord::Migration[5.2]
  def change
    create_table :energylogs do |t|
      t.string :date
      t.integer :rating
    end
  end
end
