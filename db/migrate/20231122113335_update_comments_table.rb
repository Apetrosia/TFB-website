class UpdateCommentsTable < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :topic, foreign_key: true
  end
end
