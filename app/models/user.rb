class User < ApplicationRecord
	before_save {self.email = email.downcase}
	has_many :invitations, dependent: :destroy
	has_many :authorizations
	validates :user_name,  presence: true, length: { maximum: 50 }, on: :create
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }, on: :create
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }, on: :create
	#カラムの名前をmount_uploaderに指定
	mount_uploader :image, ImageUploader, on: :update # 一字的ににバリデーションの有効タイミングを設定

	def User.create_from_auth!(auth)
		#authの情報を元にユーザー生成の処理を記述
		#auth["credentials"]にアクセストークン、シークレットなどの情報が入ってます。
		#auth["info"]["email"]にユーザーのメールアドレスが入ってます。(Twitterはnil)
	end
end
