class Challenge < ActiveRecord::Base
  # belongs_to :user
  has_many :relationships
  has_many :users, through: :relationships
  # validates :user_id, presence: true
  # default_scope -> {order(created_at: :desc)}
  default_scope -> { order(created_at: :desc) }
end
