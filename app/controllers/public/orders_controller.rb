class Public::OrdersController < ApplicationController
  # GET /public/orders
  # GET /public/orders.json
  layout 'public/main'
  # GET /public/orders/1
  # GET /public/orders/1.json

  def show
    @order = Order.find(params[:id])
    if @order.user != @user
      redirect_to '/'
      return
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /public/orders/new
  # GET /public/orders/new.json
  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # POST /public/orders
  # POST /public/orders.json
  def create
    @order = Order.new(params[:order])

    respond_to do |format|
      if @order.save
        @cart.items.each do |i|
          i.order_id = @order.id
          i.save
        end
        @cart.clear
        format.html { redirect_to public_order_url(@order), notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @public_order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

 end
