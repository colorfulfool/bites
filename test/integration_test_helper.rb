class ActionDispatch::IntegrationTest
  def log_in_as(user)
    post sessions_path, params: { user: {email: user.email, password: 'secret'} }
    assert_redirected_to root_path
  end
end