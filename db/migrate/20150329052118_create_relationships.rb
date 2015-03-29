class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :user_id
      t.integer :challenge_id

      t.timestamps null: false
    end
    add_index :relationships, :user_id
    add_index :relationships, :challenge_id
    add_index :relationships, [:user_id, :challenge_id], unique: true
  end
end
