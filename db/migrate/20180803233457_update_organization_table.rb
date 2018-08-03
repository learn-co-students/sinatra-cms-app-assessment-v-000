class UpdateOrganizationTable < ActiveRecord::Migration
  def change
    add_column :organizations, :category_id, :integer
    add_column :organizations, :location_id, :integer
    add_column :organizations, :account, :text
    add_column :organizations, :description, :text
    add_column :organizations, :aggregate_rank, :integer
    add_column :organizations, :daily_rank, :integer
    add_column :organizations, :tag1, :integer
    add_column :organizations, :tag2, :integer
    add_column :organizations, :tag3, :integer
    add_column :organizations, :tag4, :integer
  end
end
