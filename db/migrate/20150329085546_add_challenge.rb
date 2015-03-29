class AddChallenge < ActiveRecord::Migration
  def change
  	create_table :users do |t|
      t.string :name
      t.string :email
      t.timestamps null: false
    end
 
    create_table :challenges do |t|
      t.string :title
      t.text :task
      t.date :endDate
      t.float :money
      t.timestamps null: false
    end
 
    create_table :relationships do |t|
      t.integer :user_id, index: true
      t.integer :challenge_id, index: true
      t.datetime :relationship_date
      t.timestamps null: false
    end
  end
end
