  class Administration::BrandsController < Administration::AdministrationController
  # GET /administration/brands
  # GET /administration/brands.json
  before_filter :only => [:create, :update] do |controller|
    controller.set_alias_by_name('brand')
  end

  def index
    @brands = Brand.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @brands }
    end
  end

  # GET /administration/brands/1
  # GET /administration/brands/1.json
  def show
    @brand = Brand.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @brand }
    end
  end

  # GET /administration/brands/new
  # GET /administration/brands/new.json
  def new
    @brand = Brand.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @brand }
    end
  end

  # GET /administration/brands/1/edit
  def edit
    @brand = Brand.find(params[:id])
  end

  # POST /administration/brands
  # POST /administration/brands.json
  def create
    @brand = Brand.new(params[:brand])

    respond_to do |format|
      if @brand.save
        format.html { redirect_to administration_brands_url, notice: 'Brand was successfully created.' }
        format.json { render json: @brand, status: :created, location: @brand }
      else
        format.html { render action: "new" }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /administration/brands/1
  # PUT /administration/brands/1.json
  def update
    @brand = Brand.find(params[:id])

    respond_to do |format|
      if @brand.update_attributes(params[:brand])
        format.html { redirect_to administration_brands_url, notice: 'Brand was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /administration/brands/1
  # DELETE /administration/brands/1.json
  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy

    respond_to do |format|
      format.html { redirect_to administration_brands_url }
      format.json { head :no_content }
    end
  end
end
