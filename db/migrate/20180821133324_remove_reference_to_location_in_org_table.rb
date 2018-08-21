class RemoveReferenceToLocationInOrgTable < ActiveRecord::Migration
  def change
    remove_column :organizations, :location_id
  end
end
