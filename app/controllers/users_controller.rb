class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.includes(:user).order("created_at DESC")
  end
end
