class Administration::SurfacesController < Administration::AdministrationController
  # GET /administration/surfaces
  # GET /administration/surfaces.json

  def index
    @surfaces = Surface.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @surfaces }
    end
  end

  # GET /administration/surfaces/new
  # GET /administration/surfaces/new.json
  def new
    @surface = Surface.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @surface }
    end
  end

  # GET /administration/surfaces/1/edit
  def edit
    @surface = Surface.find(params[:id])
  end

  # POST /administration/surfaces
  # POST /administration/surfaces.json
  def create
    @surface = Surface.new(params[:surface])

    respond_to do |format|
      if @surface.save
        format.html { redirect_to administration_surfaces_path, notice: 'Surface was successfully created.' }
        format.json { render json: @surface, status: :created, location: @surface }
      else
        format.html { render action: "new" }
        format.json { render json: @surface.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /administration/surfaces/1
  # PUT /administration/surfaces/1.json
  def update
    @surface = Surface.find(params[:id])

    respond_to do |format|
      if @surface.update_attributes(params[:surface])
        format.html { redirect_to administration_surfaces_path, notice: 'Surface was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @surface.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /administration/surfaces/1
  # DELETE /administration/surfaces/1.json
  def destroy
    @surface = Surface.find(params[:id])
    @surface.destroy

    respond_to do |format|
      format.html { redirect_to administration_surfaces_url }
      format.json { head :no_content }
    end
  end
end
