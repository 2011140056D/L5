class TopController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  
  def main
    @tweets = Tweet.all
    if session[:login_uid]
      render "main"
    else
      render "login_form"
    end
  end
  
  def login
      id = User.find_by(uid: params[:uid])
      #↓やすこ案
      if id && BCrypt::Password.new(id.pass) == params[:pass]
          session[:login_uid] = params[:uid]
          redirect_to action: :main
      else
          render "login_form"
      end
  end
  
  def logout
     session.delete(:login_uid)
     redirect_to root_path
  end
end
