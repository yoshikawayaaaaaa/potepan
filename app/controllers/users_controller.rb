class UsersController < ApplicationController
  def show 
    @user = User.find_by(id: params[:id])
   
  end
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
end
