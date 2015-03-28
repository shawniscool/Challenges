class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :new
      t.string :title
      t.string :task

      t.timestamps null: false
    end
  end
end
