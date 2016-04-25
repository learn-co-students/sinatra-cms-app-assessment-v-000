class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.string :stars
    end
  end
end
