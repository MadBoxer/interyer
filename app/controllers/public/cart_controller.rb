class Public::CartController < ApplicationController
  layout 'public/main'
  before_filter :get_cart
  def show
    
  end
  
  def add_to_cart
    p = Product.find(params[:id])
    @cart.add_to_cart(p)
    #redirect_to :controller => :cart, :action => :show
  end
  
  def delete_from_cart
    @cart.delete_from_cart Product.find(params[:product_id])
  end

  def reset_cart
    @cart.reset_cart(params[:product])
    redirect_to '/cart'
  end
  
  private #-------------
  
  def get_cart
    @cart = find_or_create
  end
  def find_or_create
    session[:cart] ||= Cart.new
  end


  
end
