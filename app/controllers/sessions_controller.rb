class SessionsController < ApplicationController

  def new
  end

  def create
    if user_valid?(params[:name], params[:password])
      session[:name] = params[:name]
      session[:user_id] = current_user.id
      # session[:name] = params[:name]
      redirect_to user_path(current_user)
    else
      redirect_to login_path
    end
  end

  def destroy
  end
end
