class UpdateOrgTable < ActiveRecord::Migration
  def change
    add_column :organizations, :address, :text
    add_column :organizations, :phone, :text
    add_column :organizations, :email, :text
    add_column :organizations, :website, :text
    add_column :organizations, :user_id, :integer
  end
end
