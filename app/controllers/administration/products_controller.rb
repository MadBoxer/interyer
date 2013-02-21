class Administration::ProductsController < Administration::AdministrationController
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
    @administration_product = Product.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @administration_product }
    end
  end

  # GET /administration/products/1/edit
  def edit
    @administration_product = Product.find(params[:id])
  end

  # POST /administration/products
  # POST /administration/products.json
  def create
    @administration_product = Product.new(params[:product])
    respond_to do |format|
      if @administration_product.save
          format.html { redirect_to administration_product_path(@administration_product), notice: 'Product was successfully created.' }
          format.json { render json: @administration_product, status: :created, location: @administration_product }
      else
        format.html { render action: "new" }
        format.json { render json: @administration_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /administration/products/1
  # PUT /administration/products/1.json
  def update
    @administration_product = Product.find(params[:id])
    @administration_product.admin_update_images params
    
#=begin 
    
    respond_to do |format|
      if @administration_product.update_attributes(params[:product])
        format.html { redirect_to edit_administration_product_url(@administration_product), notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @administration_product.errors, status: :unprocessable_entity }
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
