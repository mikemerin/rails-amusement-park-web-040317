class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if user_valid?(params[:name], params[:password])
      session[:name] = params[:name]
      session[:user_id] = current_user.id
      redirect_to user_path(current_user)
    else
      flash[:notice] = "Username or password wasn't found."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end
