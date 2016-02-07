class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.page params[:page]
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    params['suborders'].each do |a, b|
      startdt = (b['startdt(1i)'] + '-' +b['startdt(2i)'] + '-' +b['startdt(3i)']+' ' +b['startdt(4i)']+':' +b['startdt(5i)']).to_time(:utc)
      stopdt = (b['stopdt(1i)']+ '-' +b['stopdt(2i)'] + '-' +b['stopdt(3i)']+' ' +b['stopdt(4i)']+':' +b['stopdt(5i)']).to_time(:utc)
      startt = ('0-1-1 ' + b['startt(4i)'] + ':' + b['startt(5i)']).to_time(:utc)
      stopt = ('0-1-1 ' + b['stopt(4i)']+':' +b['stopt(5i)']).to_time(:utc)

      @order.suborders.new(
          order_id: @order.id,
          device_id: b[:device_id],
          period_id: b[:period_id],
          startdt: startdt,
          stopdt: stopdt,
          startt: startt,
          stopt: stopt
      );
      b [:files].each do |c|
        @order.suborders.last.plists.new(mediafile_id: c.to_i)
      end

    end

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:name, :status_id, :sun, :mon, :tue, :wed, :thu, :fri, :sat)
    end
end
