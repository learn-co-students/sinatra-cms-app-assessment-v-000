class CreateRecommendations < ActiveRecord::Migration

  def change
    create_table :recommendations do |t|
      t.string :recommendation
      t.integer :user_id
    end
  end

end
