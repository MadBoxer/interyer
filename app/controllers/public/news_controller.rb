class Public::NewsController < ApplicationController
  require 'rubygems'
  require 'hpricot'
  layout 'public/main'
  def index
    @news = News.avail
    @news.each{|n| n.announce = Hpricot.uxs(n.announce)}
  end

  def show
    @news_item = News.avail.where(:alias => params[:news_ref]).first
  end

end
