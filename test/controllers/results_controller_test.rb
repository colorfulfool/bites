require 'test_helper'

class ResultsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_experiment_result_path(experiments(:long_survey)), xhr: true
    assert_response :success
  end
end
