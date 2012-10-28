class Administration::CategoriesController < ApplicationController
  # GET /administration/categories
  # GET /administration/categories.json
  def index
    @administration_categories = Category.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @administration_categories }
    end
  end

  # GET /administration/categories/1
  # GET /administration/categories/1.json
  def show
    @administration_category = Category.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @administration_category }
    end
  end

  # GET /administration/categories/new
  # GET /administration/categories/new.json
  def new
    @administration_category = Category.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @administration_category }
    end
  end

  # GET /administration/categories/1/edit
  def edit
    @administration_category = Category.find(params[:id])
  end

  # POST /administration/categories
  # POST /administration/categories.json
  def create
    @administration_category = Category.new(params[:administration_category])

    respond_to do |format|
      if @administration_category.save
        format.html { redirect_to @administration_category, notice: 'Category was successfully created.' }
        format.json { render json: @administration_category, status: :created, location: @administration_category }
      else
        format.html { render action: "new" }
        format.json { render json: @administration_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /administration/categories/1
  # PUT /administration/categories/1.json
  def update
    @administration_category = Category.find(params[:id])

    respond_to do |format|
      if @administration_category.update_attributes(params[:administration_category])
        format.html { redirect_to @administration_category, notice: 'Category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @administration_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /administration/categories/1
  # DELETE /administration/categories/1.json
  def destroy
    @administration_category = Category.find(params[:id])
    @administration_category.destroy

    respond_to do |format|
      format.html { redirect_to administration_categories_url }
      format.json { head :no_content }
    end
  end
end
