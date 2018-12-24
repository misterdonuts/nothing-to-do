require 'test_helper'

class InvitationRelationsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get invitation_relations_show_url
    assert_response :success
  end

end
