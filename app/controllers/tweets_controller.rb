class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  
  def new
    @tweet = Tweet.new
  end
  
  def create
    @tweet = Tweet.new(message: params[:tweet][:message],user_id: current_user.id)
    if @tweet.save
      redirect_to controller: :top, action: :main
    else
      render "new"
    end
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to controller: :top, action: :main
  end
end
