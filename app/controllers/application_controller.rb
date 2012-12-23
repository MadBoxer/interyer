class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :find_or_create, :is_logined?

  private #-------------
  def find_or_create
    session[:cart] ||= Cart.new
    @cart = session[:cart]
  end
  def is_logined?
    @user = User.new
    if session[:user]
      user = session[:user]
      @user = User.find(user.id)
      unless @user
        return false
      else
        return @user
      end
    else
      if cookies[:user_sess]
        res = ActiveRecord::Base.connection.select('SELECT id FROM sessions WHERE session_id = \''+ cookies[:user_sess] +'\'')
      end
    end
    @user = nil
  end

  def contacts

  end
end