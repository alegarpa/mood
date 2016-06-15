class Feeling < ActiveRecord::Base
	belongs_to :user
	validates :user_id, presence: true
	default_scope -> { order(created_at: :desc) }
	validates :status, presence:true, length: {maximum: 30}
	before_save { self.status = status.downcase }

end
