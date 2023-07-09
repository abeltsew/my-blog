class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :author_id
      t.string :title
      t.text :text
      t.integer :comment_counter
      t.integer :likes_counter
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
