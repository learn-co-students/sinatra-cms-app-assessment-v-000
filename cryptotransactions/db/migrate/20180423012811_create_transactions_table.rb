class CreateTransactionsTable < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :currency
      t.float :price
      t.text :comments
      t.integer :user_id
      t.timestamps
    end
  end
end
