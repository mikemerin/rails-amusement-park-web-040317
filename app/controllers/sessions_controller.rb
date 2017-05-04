class SessionsController < ApplicationController

  def new
    # @user = User.new

  end

  def create
    # @user = User.find_by(name: params[:name])
    session[:name] = params[:name]
    session[:password] = params[:password]
    
  end

  def destroy
  end
end
