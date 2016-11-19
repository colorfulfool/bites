class SessionsController < ApplicationController
  def create
    log_in_with_email
  end

private

  def log_in_with_email
    @user = User.find_by email: params[:user][:email]
    if @user.present?
      if @user.authenticate(params[:user][:password])
        log_in @user
        flash[:notice] = I18n.t('welcome.logged_in', user: @user.first_name)
        redirect_to root_path
      else
        @user.errors[:password] << 'Wrong password'
      end
    else
      @user = User.new(params.require(:user).permit(:email))
      @user.errors[:email] << "Can't find a user with this email."
    end
  end
end
