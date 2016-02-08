class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show, :edit, :update, :destroy, :start]

  def create_days(m, tu, w, th, f, s, sun)
    result = ""
    result += "1," if m == true
    result += "2," if tu == true
    result += "3," if w == true
    result += "4," if th == true
    result += "5," if f == true
    result += "6," if s == true
    result += "7," if sun == true
    return result if result.size == 0
    result[0..-2]
  end

  def start
    # <TRACKS><TRACK><HASH>995601c21bde3d16f6b4e1d6e22d9361</HASH><IMGHASH>1a45c2f07844e503f2ee09fde16c4a6f</IMGHASH></TRACK></TRACKS>
    # <TASK><TASK_ID>143676</TASK_ID><TYPE>PLAYLIST.MUSIC</TYPE>
    # #<BEGINDATE>2012-09-26 12:51:20</BEGINDATE>
    # #<ENDDATE>2012-10-11 21:00:00</ENDDATE>
    # #<BEGINTIME>09:15:00</BEGINTIME>
    # #<ENDTIME>21:00:00</ENDTIME>
    # #<DAYS>1,2,3,4,5,6,7</DAYS>
    # #<PERIOD>2</PERIOD>
    # #<TRACKS><TRACK><HASH>6a382c33d0d12dceff5aeea30845985c</HASH></TRACK></TRACKS></TASK>
    #
    @order.suborders.each do |order|
      begindate = "<BEGINDATE>#{order.startdt.to_s[0..18]}</BEGINDATE>"
      enddate = "<ENDDATE>#{order.stopdt.to_s[0..18]}</ENDDATE>"
      begintime = "<BEGINTIME>#{order.startt.to_s[11..18]}</BEGINTIME>"
      endtime = "<ENDTIME>#{order.stopt.to_s[11..18]}</ENDTIME>"
      days = "<DAYS>#{create_days(@order.mon, @order.tue, @order.wed, @order.thu, @order.fri, @order.sat, @order.sun)}</DAYS>"               #FIXME days in order.mon:boolean ...
      period = "<PERIOD>#{order.period.value}</PERIOD>"

      tracks=""
      order.plists.each do |file|
        tracks += "<TRACK><HASH>#{file.mediafile.md5}</HASH></TRACK>" if file.mediafile.present?
      end

      order.device.tasks.create(typeoftask_id: 14, typeofstatus_id: 1, options: "#{begindate}#{enddate}#{begintime}#{endtime}#{days}#{period}<TRACKS>#{tracks}</TRACKS>")

      order.plists.each do |file|
        if file.mediafile.present?
          if order.device.tasks.where(mediafile_id: file.mediafile.id).empty?
            order.device.tasks.create(typeoftask_id: 1, typeofstatus_id: 1, options: "<URLS><URL>http://192.168.0.91:3000#{file.mediafile.file}|#{file.mediafile.md5[-4..-1]}</URL></URLS>", mediafile_id: file.mediafile.id)
          end
        end
      end
    end
    #Play
    @order.update(status_id: 2)

    respond_to do |format|
      format.html { render :show }
    end
  end

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
    @old_order = Order.find(params[:old_id]) if params[:old_id]
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.status_id = 1
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
        @order.suborders.last.plists.new(mediafile_id: c.to_i) unless c == ''
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
