class Public::ProductController < ApplicationController
  layout 'public/main'
  
  def show
    @product = Product.get(params)
    unless @product
      render :controller => 'application', :action => 'not_found'
    end
  end
  
  def add_to_cart
    p = Product.find(params[:id])
    @cart.add_to_cart(p)
    redirect_to :controller => :cart, :action => :show
  end

  def search
    @products = Product.search(params[:search])
  end

end
