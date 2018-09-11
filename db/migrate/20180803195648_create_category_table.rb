class CreateCategoryTable < ActiveRecord::Migration
  def change
    create_table :categorys do |t|
      t.text :name
    end
  end
end
