class CreateConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :conversations do |t|
      t.references :room, foreign_key: true
      t.integer :send_id
      t.integer :receive_id

      t.timestamps
    end
  end
end
