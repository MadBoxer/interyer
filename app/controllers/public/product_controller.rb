class Public::ProductController < ApplicationController
  layout 'public/main'
  
  def show
    if params[:cat_ref]
      if params[:prod_ref]
        @product = Category.available(:alias => params[:cat_ref]).first.products.available(:alias => params[:prod_ref]).first
      end
      if params[:id]
        @product = Category.available(:alias => params[:cat_ref]).first.products.available(:id => params[:id]).first
      end
    else
      if params[:prod_ref]
        @product = Product.available(:alias => params[:prod_ref]).first
      else
        render :partial => 'public/shared/not_found'
      end
    end
  end
  
  def add_to_cart
    p = Product.find(params[:id])
    @cart.add_to_cart(p)
    redirect_to :controller => :cart, :action => :show
  end
  
  def simple_cart
    
  end
  
end
