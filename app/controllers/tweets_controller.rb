class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  
  def new
    @tweet = Tweet.new
  end
  
  def create
    user = User.find_by(uid: session[:login_uid])
    
    @tweet = Tweet.new(message: params[:tweet][:message],user_id: user.id)
    @tweet.save
    redirect_to controller: :top, action: :main
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to controller: :top, action: :main
  end
end
