class User < ApplicationRecord
	validates :user_name, presence:true
	validates :email, presence:true
	validates :user_name,  presence: true, length: { maximum: 50 }
	validates :email, presence: true, length: { maximum: 255 }
end
