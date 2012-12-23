class Public::CategoryController < ApplicationController
  
  layout 'public/main'

  #before_filter :get_by_alias, :only => ['show']
  def index
    @category = Category.order(:sort)
    @products = Product.where(:main_page => true)
  end
  
  def show
    @category = Category.get_by_params(params)
    if @category
      @products = @category.products.page(params[:page])#@category.products.page(params[:page])
    else
      render :controller => 'application', :action => 'not_found'
    end
  end
  
  private #------------------

end
