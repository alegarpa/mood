class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	validates :name, presence: true, length: {maximum: 50}
	validates :password, presence: true, length: {minimum: 6 }, allow_nil: true
	has_many :feelings, dependent: :destroy
	#validates :password, presence: true, length: {minimum: 6}, allow_nil: true
	#Hopefully this regex stops everything
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

	validates :email, presence:true, length: {maximum: 255}, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	has_secure_password
	attr_accessor :remember_token


	  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def feel(input)
  	feelings.create(status: input)
  end

  def User.new_token
  	SecureRandom.urlsafe_base64
  end

  def remember
  	self.remember_token = User.new_token
  	update_attribute(:remember_digest, User.digest(remember_token))
  end

  def feed
    Feeling.where("user_id = ?", id)
  end

  # Returns true is the given token matches the digest
  def authenticated?(remember_token)
  	return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
  	update_attribute(:remember_digest, nil)
  end




end
