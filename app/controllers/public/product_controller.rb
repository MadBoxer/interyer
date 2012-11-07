class Public::ProductController < ApplicationController
  def index
    if params[:cat_ref]
      if params[:prod_ref]
        @product = Category.where(:alias => params[:cat_ref]).where(:active => 1, :trash => 0).first
      end
      if params[:id]
        @product = Category.find(:id).where(:active => 1, :trash => 0).first
      end
    else
      render :partial => 'page_not_found'
    end
  end
  
  private #-------------
  
end
