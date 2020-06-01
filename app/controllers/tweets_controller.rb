class TweetsController < ApplicationController

  before_action :login?

  def index
  end

  private

  def login?
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end