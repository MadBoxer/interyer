class Administration::DiscountsController < Administration::AdministrationController
  # GET /administration/discounts
  # GET /administration/discounts.json
  def index
    @discounts = Discount.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @discounts }
    end
  end


  # GET /administration/discounts/new
  # GET /administration/discounts/new.json
  def new
    @discount = Discount.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @discount }
    end
  end

  # GET /administration/discounts/1/edit
  def edit
    @discount = Discount.find(params[:id])
    @products = Product.where('discount_id' => @discount.id)
    @categories = Category.all
  end

  # POST /administration/discounts
  # POST /administration/discounts.json
  def create
    @discount = Discount.new(params[:discount])

    respond_to do |format|
      if @discount.save
        format.html { redirect_to administration_discounts_url, notice: 'Discount was successfully created.' }
        format.json { render json: @discount, status: :created, location: @discount }
      else
        format.html { render action: "new" }
        format.json { render json: @discount.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /administration/discounts/1
  # PUT /administration/discounts/1.json
  def update
    @discount = Discount.find(params[:id])
    @discount.products = Product.find(params[:products].keys.select{|key| params[:products][key] != '0'})

    respond_to do |format|
      if @discount.update_attributes(params[:discount])
        format.html { redirect_to administration_discounts_url, notice: 'Discount was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @discount.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /administration/discounts/1
  # DELETE /administration/discounts/1.json
  def destroy
    @discount = Discount.find(params[:id])
    @discount.destroy

    respond_to do |format|
      format.html { redirect_to administration_discounts_url }
      format.json { head :no_content }
    end
  end

  def get_children
    cat = Category.find(params[:id])
    children = cat.get_children_cats
    render :partial => 'cat_select', :locals => {:categories => children, :name => 'children_category'}
  end

  def get_products
    cat = Category.find(params[:id])
    products = cat.get_products.where('discount_id != ?', params[:discount]);
    render :partial => 'prod_list', :locals => {:products => products, :discount => Discount.find(params[:discount])}
  end
end