class Relationship < ActiveRecord::Base
	belongs_to :User
	belongs_to :Challenge
	validates :user_id, presence: true
	validates :challenge_id, presence: true
	
end
