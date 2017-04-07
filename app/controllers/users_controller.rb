class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if current_user == nil
      redirect_to root_path
    elsif @user.id == current_user.id
      @user = current_user
    end
  end
end
