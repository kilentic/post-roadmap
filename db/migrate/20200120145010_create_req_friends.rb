class CreateReqFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :req_friends do |t|
      t.integer :req_user_id
      t.integer :res_user_id
      t.boolean :seen, default: false

      t.timestamps
    end
  end
end
