class CreateRecommendationsTable < ActiveRecord::Migration
  def change
   create_table :recommendations do |t|
     t.string :content
     t.integer :user_id
   end
  end
end
