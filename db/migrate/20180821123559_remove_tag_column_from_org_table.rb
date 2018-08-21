class RemoveTagColumnFromOrgTable < ActiveRecord::Migration
  def change
    remove_column :organizations, :tag1
    remove_column :organizations, :tag2
    remove_column :organizations, :tag3
    remove_column :organizations, :tag4
  end
end
