class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.date :birthday
      t.string :gender
      t.string :address
      t.integer :phone

      t.timestamps
    end
  end
end
