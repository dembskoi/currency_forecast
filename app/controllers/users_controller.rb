class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    redirect_to current_user, alert: 'Access denied.' unless @user == current_user
  end
end
