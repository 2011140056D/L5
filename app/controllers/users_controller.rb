class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(uid: params[:user][:uid],password: params[:user][:password],password_confirmation: params[:user][:password_confirmation])
    if @user.save
      redirect_to root_path
    else
      render "new"
    end
  end
  
  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to controller: :users,action: :index
  end
end
