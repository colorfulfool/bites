require 'test_helper'

class ExperimentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @experiment = experiments(:short_survey)
    log_in_as users(:dano)
  end

  test "overwrites last_updator on update" do
    assert @experiment.action.nil?

    patch experiment_path(@experiment), params: {
      experiment: { action_attributes: {body: 'Abandon ship'} }
    }
    assert_response :found
    # assert_redirected_to experiment_path assigns(:experiment)

    @experiment.reload
    assert_equal 'Abandon ship', @experiment.action.body
    assert_equal users(:dano), @experiment.action.last_updator
    assert_equal users(:anton), @experiment.assumption.last_updator
  end

  # test "should create experiment" do
  #   assert_difference('Experiment.count') do
  #     post :create, experiment: { action: @experiment.action, assumption: @experiment.assumption, result: @experiment.result }
  #   end

  #   assert_redirected_to experiment_path(assigns(:experiment))
  # end

  # test "should show experiment" do
  #   get :show, id: @experiment
  #   assert_response :success
  # end
end
