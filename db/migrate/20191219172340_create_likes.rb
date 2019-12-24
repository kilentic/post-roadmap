class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.string :duty_type
      t.integer :duty_id, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
