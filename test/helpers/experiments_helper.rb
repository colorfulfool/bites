require 'test_helper'

class ExperimentsHelperTest < ActionView::TestCase
  test 'highlight_references' do
    result = highlight_references 'This [experiment] stems from the [previous one:34]'
    assert_equal 'This <u>experiment</u> stems from the <u>previous one</u>', result
  end
end