class AddEmailToken < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :email_token, :string
  end
end
