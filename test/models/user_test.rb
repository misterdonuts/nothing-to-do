require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup
		@user = User.new(user_name:"example user", email:"user@example.com")
	end

	test "should be valid" do
		assert @user.valid?
	end

	test "user_name should be present" do
		@user.user_name = ""
		assert_not @user.valid?
	end

	test "email should be present" do
		@user.email =  "  "
		assert_not @user.valid?
	end

	test "user_name should not be too long" do
		@user.user_name = "a" * 51
		assert_not @user.valid?
	end

	test "email should not be too long" do
		@user.email = "a" * 244 + "@example.com"
		assert_not @user.valid?
	end
end
	