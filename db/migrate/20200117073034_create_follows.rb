class CreateFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|
      t.string :follower_id
      t.string :followee_id
      t.index [:follower_id, :followee_id], unique: true

      t.timestamps
    end

  end
end
