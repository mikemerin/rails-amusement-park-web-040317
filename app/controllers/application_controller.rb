class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :authorize_user

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def user_valid?(user, password)
    user.try(:authenticate, password)
  end

  def authorize_user
    if !session[:user_id].present?
      flash[:notice] = 'You are not allowed to do that unless you are logged in'
      redirect_to root_path
    end
  end
end
