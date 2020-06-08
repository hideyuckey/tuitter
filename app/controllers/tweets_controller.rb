class TweetsController < ApplicationController

  before_action :login?

  def index
    @tweet = Tweet.new
    @tweets = Tweet.all.order("created_at DESC")
  end

  def create
    Tweet.create(tweet_params)
    redirect_to action: :index
  end

  private
  def tweet_params
    params.require(:tweet).permit(:message, :image).merge(user_id: current_user.id)
  end

  def login?
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end