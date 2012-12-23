class Public::UserController < ApplicationController
  # GET /public/users
  # GET /public/users.json
  layout 'public/main'
  before_filter :check_registration
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /public/users/1
  # GET /public/users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /public/users/new
  # GET /public/users/new.json
  def new
    if params[:submit]
      @user = User.new(params[:user])
  
      respond_to do |format|
        if @user.save
          format.html { redirect_to '/', notice: 'User was successfully created.' }
          format.json { render json: @user, status: :created, location: @user }
        else
          format.html { render action: "new" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      @user = User.new
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @user }
      end
    end
  end

  # GET /public/users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /public/users
  # POST /public/users.json

  def create
    if params[:submit]
      @user = User.new(params[:user])
  
      respond_to do |format|
        if @user.save
          format.html { redirect_to '/', notice: 'User was successfully created.' }
          format.json { render json: @user, status: :created, location: @user }
        else
          format.html { render action: "new" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      @user = User.new
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @user }
      end
    end
  end
  

  # PUT /public/users/1
  # PUT /public/users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def unlogin
    session[:user] = nil
    redirect_to :back
  end
  def login
    if @user
      redirect_to :back
    end
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
  private#--------------------
  def check_registration
    
  end
end









