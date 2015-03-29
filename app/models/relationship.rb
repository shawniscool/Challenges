class Relationship < ActiveRecord::Base
	belongs_to :User
	belongs_to :Challenge
end
