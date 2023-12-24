class UpdateCRandLikeCount < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :comment_rake, :comment_rate
    change_column :comments, :like_count, :integer, :default => 0
  end
end
