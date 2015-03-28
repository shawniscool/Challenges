class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.text :content
      t.string :title
      t.date :endDate

      t.timestamps null: false
    end
    add_foreign_key :challenges, :users
    add_index :challenges, [:user_id, :created_at]
  end
end
