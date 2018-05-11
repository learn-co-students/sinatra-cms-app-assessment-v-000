class CreateSleeplogs < ActiveRecord::Migration[5.2]
  def change
    create_table :sleeplogs do |t|
      t.string :date
      t.string :type
      t.string :hours
    end
  end
end
