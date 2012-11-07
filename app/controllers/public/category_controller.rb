class Public::CategoryController < ApplicationController
  
  before_filter :get_by_alias, :only => ['show']
  def index
    @category = Category.where('alias=\''+params['cat_ref']+'\'')
  end
  
  def show
    
  end
  
  private #------------------
  def get_by_alias
    if params[:cat_ref]
      @category = Category.where('alias=\''+params[:cat_ref]+'\'').first
    else
      if params[:id]
        @category = Category.find(params[:id])
      end
    end
    if not @category
      render :partial => 'public/shared/not_found'
    end
    @products = []
    if @category
      @products = @category.products.page(params[:page])#@category.products.page(params[:page])
    end
  end
end
