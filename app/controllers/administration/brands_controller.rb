class Administration::BrandsController < ApplicationController
  # GET /administration/brands
  # GET /administration/brands.json
  def index
    @administration_brands = Brand.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @administration_brands }
    end
  end

  # GET /administration/brands/1
  # GET /administration/brands/1.json
  def show
    @administration_brand = Brand.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @administration_brand }
    end
  end

  # GET /administration/brands/new
  # GET /administration/brands/new.json
  def new
    @administration_brand = Brand.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @administration_brand }
    end
  end

  # GET /administration/brands/1/edit
  def edit
    @administration_brand = Brand.find(params[:id])
  end

  # POST /administration/brands
  # POST /administration/brands.json
  def create
    @administration_brand = Brand.new(params[:administration_brand])

    respond_to do |format|
      if @administration_brand.save
        format.html { redirect_to @administration_brand, notice: 'Brand was successfully created.' }
        format.json { render json: @administration_brand, status: :created, location: @administration_brand }
      else
        format.html { render action: "new" }
        format.json { render json: @administration_brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /administration/brands/1
  # PUT /administration/brands/1.json
  def update
    @administration_brand = Brand.find(params[:id])

    respond_to do |format|
      if @administration_brand.update_attributes(params[:administration_brand])
        format.html { redirect_to @administration_brand, notice: 'Brand was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @administration_brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /administration/brands/1
  # DELETE /administration/brands/1.json
  def destroy
    @administration_brand = Brand.find(params[:id])
    @administration_brand.destroy

    respond_to do |format|
      format.html { redirect_to administration_brands_url }
      format.json { head :no_content }
    end
  end
end
