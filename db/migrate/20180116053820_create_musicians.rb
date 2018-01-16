class CreateMusicians < ActiveRecord::Migration[5.1]
  def change
    create_table :musicians do |t|
      t.string :username
      t.string :password_digest
    end
  end
end
