# frozen_string_literal: true

require 'application_system_test_case'

class GroupInvitationsTest < ApplicationSystemTestCase
  setup do
    @group_invitation = group_invitations(:one)
  end

  test 'visiting the index' do
    visit group_invitations_url
    assert_selector 'h1', text: 'Group Invitations'
  end

  test 'creating a Group invitation' do
    visit group_invitations_url
    click_on 'New Group Invitation'

    fill_in 'Group', with: @group_invitation.group_id
    fill_in 'Sender', with: @group_invitation.sender_id
    fill_in 'Status', with: @group_invitation.status
    fill_in 'User', with: @group_invitation.user_id
    click_on 'Create Group invitation'

    assert_text 'Group invitation was successfully created'
    click_on 'Back'
  end

  test 'updating a Group invitation' do
    visit group_invitations_url
    click_on 'Edit', match: :first

    fill_in 'Group', with: @group_invitation.group_id
    fill_in 'Sender', with: @group_invitation.sender_id
    fill_in 'Status', with: @group_invitation.status
    fill_in 'User', with: @group_invitation.user_id
    click_on 'Update Group invitation'

    assert_text 'Group invitation was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Group invitation' do
    visit group_invitations_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Group invitation was successfully destroyed'
  end
end
