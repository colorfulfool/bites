require 'test_helper'

class LaboratoriesControllerTest < ActionDispatch::IntegrationTest
  test "renders list of user's Laboratories" do
    log_in_as users(:anton)
    get laboratories_path
    assert_response :found
  end

  test "redirects to user's Laboratory if he only has one" do
    log_in_as users(:dano)
    get laboratories_path
    assert_redirected_to laboratories(:school)
  end
end
