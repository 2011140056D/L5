class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  
  def new
    @tweet = Tweet.new
  end
  
  def create
    id = User.find_by(uid: session[:login_uid])
    
    #user = User.find_by(uid:session[:login_uid])
    @tweet = Tweet.new(message: params[:tweet][:message],user_id: id.id)
    @tweet.save
    redirect_to controller: :top, action: :main
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to controller: :top, action: :main
  end
end
