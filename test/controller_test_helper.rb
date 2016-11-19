class ActionController::TestCase
  def current_user_is(user)
    cookies.signed[:current_user] = user.id
  end
end