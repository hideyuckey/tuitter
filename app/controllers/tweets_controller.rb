class TweetsController < ApplicationController

  before_action :login?

  def index
    @tweet = Tweet.new
    @tweets = Tweet.all.order("created_at DESC")
  end

  def show
  end

  def create
    Tweet.create(tweet_params)
    redirect_to action: :index
  end

  def likes
    like = Like.find_by(user_id: current_user.id, tweet_id: params[:id])
    @tweet = Tweet.find(params[:id])
    unless likes.present?
      likes.save
      new_likes = @tweet.good + 1
      @tweet.update(good: new_likes)
    else
      likes.destroy
      new_likes = @tweet.good - 1 unless new_likes == 0
      @tweet.update(good: new_likes)
    end
    binding.pry
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