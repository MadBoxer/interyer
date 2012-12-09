class Public::UserController < ApplicationController
  
  before_filter :is_logined?
  
  def login
    if @user
      redirect_to :back
    end
  end
  
  private
  
  def is_logined?
    if session[:user]
      user = User.find(session[:user])
      if user
        @user = user
      end
    else
      if cookies[:user_sess]
        res = ActiveRecord::Base.connection.select('SELECT id FROM sessions WHERE session_id = \''+ cookies[:user_sess] +'\'')
      end
    end
    @user = nil
  end
end
