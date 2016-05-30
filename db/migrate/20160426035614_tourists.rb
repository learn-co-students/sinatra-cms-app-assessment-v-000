class Tourists < ActiveRecord::Migration
  def change
    create_table :tourists do |t|
      t.string :name
      t.string :nationality
      t.integer :cruise_ship_id
    end
  end
end
