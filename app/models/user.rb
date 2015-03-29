class User < ActiveRecord::Base
  has_many :challenges
  has_many :relationships, class_name: "Relationship", 
              foreign_key: "user_id",dependent: :destroy


	before_save { self.email = email.downcase }
	validates :name,  presence: true, length: { maximum: 50 }
  	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness:  { case_sensitive: false }
    has_secure_password
    validates :password, length: { minimum: 6 }
    # Returns the hash digest of the given string.
    def feed
      Challenge.where('user_id = ?', id)
    end

    #joins a challenge
    def join(challenge)
      relationships.create(challenge_id: challenge.id)
    end

    #quits a challenge
    def quit(challenge)
      relationships.find_by(challenge_id: challenge.id)
    end

    def playing?(challenge)
      challenges.include?(challenge)
    end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
