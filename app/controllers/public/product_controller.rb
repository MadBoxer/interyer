class Public::ProductController < ApplicationController
  def show
    if params[:cat_ref]
      if params[:prod_ref]
        @product = Category.available(:alias => params[:cat_ref]).first.products.available(:alias => params[:prod_ref]).first
      end
      if params[:id]
        @product = Category.available(:alias => params[:cat_ref]).first.products.available(:id => params[:id]).first
      end
    else
      render :partial => 'page_not_found'
    end
  end
  
  private #-------------
  
end
