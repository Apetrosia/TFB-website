class CreateForum < ActiveRecord::Migration[7.0]
  def change
    create_table :sections do |t|
      t.string :title, null: false
      t.timestamps
    end

    create_table :topics do |t|
      t.string :title, null: false
      t.references :user
      t.text :content
      t.references :section
      t.timestamps
    end

    create_table :comments do |t|
      t.text :title, null: false
      t.references :user
      t.integer :like_count
      t.integer :prt_cmt_id
      t.integer :comment_rake
      t.timestamps
    end

    create_table :likes do |t|
      t.references :user
      t.references :comment
      t.timestamps
    end
  end
end
