class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :title
      t.text :task
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :challenges, :users
    add_index :challenges, [:user_id, :created_at]
  end
end
