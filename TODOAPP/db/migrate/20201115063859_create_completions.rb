class CreateCompletions < ActiveRecord::Migration[6.0]
  def change
    create_table :completions do |t|
      t.string :content
      t.datetime :deadline
      t.datetime :starttime
      t.integer :user_id

      t.timestamps
    end
  end
end
