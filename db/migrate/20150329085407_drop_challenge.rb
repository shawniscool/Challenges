class DropChallenge < ActiveRecord::Migration
  def change
  	drop_table :challenges
  	drop_table :relationships
  	drop_table :users
  end
end
