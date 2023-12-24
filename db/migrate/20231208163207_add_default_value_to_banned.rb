class AddDefaultValueToBanned < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :banned, from: nil, to: false
  end
end
