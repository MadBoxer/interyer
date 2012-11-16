class Public::CartController < ApplicationController
  before_filter :get_cart
  def show
    
  end
  
  def add_to_cart
    p = Product.find(params[:id])
    @cart.add_to_cart(p)
    #redirect_to :controller => :cart, :action => :show
  end
  
  private #-------------
  
  def get_cart
    @cart = find_or_create
  end
  def find_or_create
    session[:cart] ||= Cart.new
  end
end
