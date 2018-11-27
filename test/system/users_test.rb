require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "creating a User" do
    visit users_url
    click_on "New User"

    fill_in "Accept Num", with: @user.accept_num
    fill_in "Email", with: @user.email
    fill_in "Be Invited Num", with: @user.be_invited_num
    fill_in "Icon Path", with: @user.icon_path
    fill_in "Invite Num", with: @user.invite_num
    fill_in "User Name", with: @user.user_name
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "updating a User" do
    visit users_url
    click_on "Edit", match: :first

    fill_in "Accept Num", with: @user.accept_num
    fill_in "Email", with: @user.email
    fill_in "Be Invited Num", with: @user.be_invited_num
    fill_in "Icon Path", with: @user.icon_path
    fill_in "Invite Num", with: @user.invite_num
    fill_in "User Name", with: @user.user_name
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "destroying a User" do
    visit users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User was successfully destroyed"
  end
end
