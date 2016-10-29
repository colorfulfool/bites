require 'test_helper'

class LaboratoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get laboratories_index_url
    assert_response :success
  end

end
