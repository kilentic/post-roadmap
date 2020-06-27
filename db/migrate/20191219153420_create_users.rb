class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.date :birthday
      t.string :gender
      t.string :address
      t.integer :phone
      t.string :email
      t.string :password_digest
      t.string :remember_digest


      t.text :image, default: "avatar-male-default.jpg"

      t.timestamps
    end
  end
end
