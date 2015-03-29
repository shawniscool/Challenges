class ChallengesUsers < ActiveRecord::Migration
  def change
  	create_table :challenges_users, :id =>false do |t|
  		t.integer :challenge_id
  		t.integer :user_id
  	end
  end
end
