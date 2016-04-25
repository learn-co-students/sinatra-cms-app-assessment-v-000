class CreateStudios < ActiveRecord::Migration
  def change
    create_table :studios do |t|
      t.string :studios
    end
  end
end
