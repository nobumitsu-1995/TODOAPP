class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :until
      t.text :content
      t.datetime :deadline
      t.integer :user_id

      t.timestamps
    end
  end
end
