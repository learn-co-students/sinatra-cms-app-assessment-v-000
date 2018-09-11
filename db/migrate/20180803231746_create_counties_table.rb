class CreateCountiesTable < ActiveRecord::Migration
  def change
    create_table :counties do |t|
      t.text :name
    end
  end
end
