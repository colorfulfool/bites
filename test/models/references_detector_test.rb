require 'test_helper'

class ReferencesDetectorTest < ActiveSupport::TestCase
  setup do
    @short_survey = experiments(:short_survey)
  end

  test 'reads a reference to an existing experiment' do
    detected = ReferencesDetector.references_in "Switch to [short survey:#{@short_survey.id}]"
    assert_equal [@short_survey], detected
  end

  test 'reads a self-reference' do
    detected = ReferencesDetector.declarations_in "Tried [short survey]"
    assert_equal ['short survey'], detected
  end
end