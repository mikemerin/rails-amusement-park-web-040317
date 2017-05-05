class UsersController < ApplicationController

  # to put in later
  # before_action: authorize_user, only: [:new, :edit, :update, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: "User was created"
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: "User was updated"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :password,
      :password_confirmation,
      :height,
      :nausea,
      :happiness,
      :tickets,
      :admin
    )
  end

end
