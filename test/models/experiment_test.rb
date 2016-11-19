require 'test_helper'

class ExperimentTest < ActiveSupport::TestCase
  setup do
    Experiment.find_each(&:save) # run ReferencesTracking callbacks
    @long_survey = experiments(:long_survey)
    @short_survey = experiments(:short_survey)
  end

  test 'update_name_from_text' do
    assert_equal 'short survey', @short_survey.name
  end

  test 'long_survey -> short_survey' do
    assert_include @long_survey.children, @short_survey
    assert_include @short_survey.parents, @long_survey
  end
end
