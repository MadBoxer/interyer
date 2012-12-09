class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :find_or_create
  private #-------------
  def find_or_create
    session[:cart] ||= Cart.new
    @cart = session[:cart]
  end
end