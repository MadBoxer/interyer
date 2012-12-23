class Public::UserController < ApplicationController
  
  before_filter :is_logined?
  layout 'public/main'
  
  def login
    if @user
      redirect_to :back
    end
  end
  
  def register
    @user = User.new
  end
  
  def cabinet
    
  end
  
  def add_user
    #unless params[:user][:fio].empty? && params[:user][:email].empty? && params[:user][:password].empty? &&params[:user][:confirm_password].empty?
      hash = {:fio => params[:user][:fio], :email => params[:user][:email], :password => Digest::MD5.hexdigest(params[:user][:password])}
      @user = User.new_based_on hash
      if not @user
        flash[:notice] = 'Registration failed'
        redirect_to :back
      else
        flash[:notice] = 'You are successfully registered'
        redirect_to '/'
      end
    #end  
  end
  
  def authorize
    unless params[:user][:email].empty? && params[:user][:password].empty?
      @user = User.where(:email => params[:user][:email]).where(:password => Digest::MD5.hexdigest(params[:user][:password])).first
      if @user
        session[:user] = @user
        redirect_to '/'
      else
        flash[:notice] = 'Incorrect login or password'
        redirect_to :back
      end
    else
      flash[:notice] = 'Login and password can\'t be empty'
      redirect_to :back
    end
  end
  
  def unlogin
    session[:user] = nil
    redirect_to '/'
  end
  
  private
  
  
end
