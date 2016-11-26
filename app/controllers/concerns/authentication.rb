module Authentication
  extend ActiveSupport::Concern

  included do
    helper_method :current_user
    helper_method :logged_in?
  end

  def logged_in?
    current_user.present?
  end

  def current_user
    User.find(cookies.signed[:current_user])
  rescue ActiveRecord::RecordNotFound
    cookies.delete(:current_user)
  end

  def log_in(user)
    cookies.permanent.signed[:current_user] = user.id
  end

  def log_out
    cookies.delete(:current_user)
  end
end