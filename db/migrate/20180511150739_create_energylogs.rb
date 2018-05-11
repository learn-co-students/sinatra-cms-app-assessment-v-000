class CreateEnergylogs < ActiveRecord::Migration[5.2]
  def change
    create_table :energylogs do |t|
      t.string :date
      t.string :rating
    end
  end
end
