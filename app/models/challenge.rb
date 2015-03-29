class Challenge < ActiveRecord::Base
  has_and_belongs_to_many :user
  # validates :user_id, presence: true
  # default_scope -> {order(created_at: :desc)}
  default_scope -> { order(created_at: :desc) }


  # added by myself
  def feed
  	User.where('challenge_id = ?', id)
  end

end
