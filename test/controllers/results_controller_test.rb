require 'test_helper'

class ResultsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    xhr :get, new_experiment_result_path(experiments(:long_survey))
    assert_response :success
  end
end
