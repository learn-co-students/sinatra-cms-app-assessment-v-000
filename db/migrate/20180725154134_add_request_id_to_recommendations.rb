class AddRequestIdToRecommendations < ActiveRecord::Migration
  def change
    add_column :recommendations, :request_id, :integer
  end
end
