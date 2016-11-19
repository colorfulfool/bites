class ActionDispatch::IntegrationTest
  def log_in_as(user)
    post sessions_path, params: { user: {email: user.email, password: 'secret'} }
    # assert_select 'div', I18n.t('welcome.logged_in', user: user.first_name)
    assert_redirected_to root_path # FIXME: assert ^
  end
end