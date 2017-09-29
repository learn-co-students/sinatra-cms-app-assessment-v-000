class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |col|
      col.string :username
      col.string :email
      col.string :password
    end
  end
end
