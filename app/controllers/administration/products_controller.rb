class Administration::ProductsController < ApplicationController
  # GET /administration/products
  # GET /administration/products.json
  layout 'administration/product'

  before_filter :only => [:create, :update] do
    if params[:product][:alias].empty?
      params[:product][:alias] = Russian::transliterate(params[:product][:name]).downcase.parameterize
    end
  end
  def index
    @administration_products = Product.page(params[:page]).per(20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @administration_products }
    end
  end

  # GET /administration/products/1
  # GET /administration/products/1.json
  def show
    @administration_product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @administration_product }
    end
  end

  # GET /administration/products/new
  # GET /administration/products/new.json
  def new
    @categories = Category.available('parent_id > 0')
    @administration_product = Product.new

   
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @administration_product }
    end
  end

  # GET /administration/products/1/edit
  def edit
    @administration_product = Product.find(params[:id])
    @categories = Category.available('parent_id > 0')
  end

  # POST /administration/products
  # POST /administration/products.json
  def create
    @administration_product = Product.new(params[:product])
    respond_to do |format|
      if @administration_product.save
        if defined? params[:current_category_redirect]
          format.html { redirect_to :controller => :categories, :action => :show, :id => params[:current_category_redirect], notice: 'Product was successfully created.' }
        else
          format.html { redirect_to [:administration, @administration_product], notice: 'Product was successfully created.' }
          format.json { render json: @administration_product, status: :created, location: @administration_product }
        end
      else
        format.html { render action: "new" }
        format.json { render json: @administration_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /administration/products/1
  # PUT /administration/products/1.json
  def update
    @product = Product.find(params[:id])
    @product.admin_update_images params
    
#=begin 
    
    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to :back, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
#=end
  end

  # DELETE /administration/products/1
  # DELETE /administration/products/1.json
  def destroy
    @administration_product = Product.find(params[:id])
    @administration_product.destroy

    respond_to do |format|
      format.html { redirect_to administration_products_url }
      format.json { head :no_content }
    end
  end
  
  private #------------------
  def set_alias
    if params[:product][:alias].empty?
      params[:product][:alias] = Russian::transliterate(params[:product][:name]).downcase.parameterize
    end
  end
end
