class TweetsController < ApplicationController
  def new
    @tweet = Tweet.new
  end

  def index
  @tweet = Tweet.all 
  end

 def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      TweetsWorker.perform_at(@tweet.timer, @tweet.id, @tweet.user_id)
      redirect_to root_url
    else
      render :new
    end
  end

  def tweet_params
      params.require(:tweet).permit(:text, :timer)
    end
end


