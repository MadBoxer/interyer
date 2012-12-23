class Administration::UsersController < Administration::AdministrationController
  # GET /administration/users
  # GET /administration/users.json

  def index
    @administration_users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @administration_users }
    end
  end

  # GET /administration/users/1
  # GET /administration/users/1.json
  def show
    @administration_user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @administration_user }
    end
  end

  # GET /administration/users/new
  # GET /administration/users/new.json
  def new
    @administration_user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @administration_user }
    end
  end

  # GET /administration/users/1/edit
  def edit
    @administration_user = User.find(params[:id])
  end

  # POST /administration/users
  # POST /administration/users.json
  def create
    @administration_user = User.new(params[:user])

    respond_to do |format|
      if @administration_user.save
        format.html { redirect_to administration_users_path, notice: 'User was successfully created.' }
        format.json { render json: @administration_user, status: :created, location: @administration_user }
      else
        format.html { render action: "new" }
        format.json { render json: @administration_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /administration/users/1
  # PUT /administration/users/1.json
  def update
    @administration_user = User.find(params[:id])

    respond_to do |format|
      if @administration_user.update_attributes(params[:user])
        format.html { redirect_to administration_users_path, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @administration_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /administration/users/1
  # DELETE /administration/users/1.json
  def destroy
    @administration_user = User.find(params[:id])
    @administration_user.destroy

    respond_to do |format|
      format.html { redirect_to administration_users_url }
      format.json { head :no_content }
    end
  end
end
