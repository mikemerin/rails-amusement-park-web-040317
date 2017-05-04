class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  private

  def current_user
    @current_user = User.find_by(name: session[:name])
  end

  def user_valid?(name, password)
    User.find_by(name: name).try(:authenticate, password)
  end

end
