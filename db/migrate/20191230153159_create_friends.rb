class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.integer :current_id
      t.integer :friend_id
      t.index [:current_id, :friend_id], unique: true

      t.timestamps
    end
  end
end
