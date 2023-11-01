class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :login, null: false
      t.string :email, unique: true, null: false
      t.string :password, null: false
      t.boolean :banned
      t.timestamps
    end
  end
end
