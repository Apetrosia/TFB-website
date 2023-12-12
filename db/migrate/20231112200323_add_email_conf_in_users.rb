class AddEmailConfInUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :email_conf, :boolean
  end
end
