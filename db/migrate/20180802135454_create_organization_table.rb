class CreateOrganizationTable < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.text :name
    end
  end
end
