class UsersController < ApplicationController

  def show
    @edituser = User.find(current_user.id)
    @user = User.find(params[:id])
    @tweets = @user.tweets.includes(:user).order("created_at DESC")
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
      else
        render :edit-user
      end
  end

  private
  def user_params
    params.require(:user).permit(:username, :text, :image, :icon)
  end
end
