class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    if check_id?(params[:id])
      @user = User.find(params[:id])
    elsif current_user == nil
      redirect_to root_path
    else
      @user = current_user
    end

  end


  private

  def check_id?(params)
    User.exists?(params)
  end
end
