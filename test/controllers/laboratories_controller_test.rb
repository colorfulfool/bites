require 'test_helper'

class LaboratoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get :index
    assert_response :success
  end

  # test "should redirect to user's Laboratory if only one"
end
