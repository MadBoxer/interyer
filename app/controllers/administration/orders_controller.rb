class Administration::OrdersController < Administration::AdministrationController
  # GET /administration/orders
  # GET /administration/orders.json

  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /administration/orders/1
  # GET /administration/orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  def change_ready
    @order = Order.find(params[:id])
    @order.ready = !@order.ready
    @order.save
  end
  # DELETE /administration/orders/1
  # DELETE /administration/orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to administration_orders_url }
      format.json { head :no_content }
    end
  end
end
