class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.references :event, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :sender_id
      t.string :link
      t.boolean :isSeen, default: false

      t.timestamps
    end
  end
end
