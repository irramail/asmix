Bclass MarketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_market, only: [:show, :edit, :update, :destroy]

  # GET /markets
  # GET /markets.json
  def index
    @markets = Market.all.page params[:page]
  end

  # GET /markets/1
  # GET /markets/1.json
  def show
  end

  # GET /markets/new
  def new
    @market = Market.new
  end

  # GET /markets/1/edit
  def edit
  end

  # POST /markets
  # POST /markets.json
  def create
    @market = Market.new(market_params)

    respond_to do |format|
      if @market.save
        24.times do |hour|
          if (10..18).include? hour
            value = 60
          else
            value = 0
          end
          if hour.to_s.length == 1
            zero = "0"
          else
            zero = ""
          end
          @market.volsofdays.create!(time: "#{zero}#{hour}:00", value: value)
        end

        7.times do |day|
          @market.worktime_broadcastings.create!(wday: day, start: "10:00", stop: "20:00")
        end

        format.html { redirect_to @market, notice: 'Market was successfully created.' }
        format.json { render :show, status: :created, location: @market }
      else
        format.html { render :new }
        format.json { render json: @market.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /markets/1
  # PATCH/PUT /markets/1.json
  def update
    params[:market][:volsofday].each do |volume|
      @market.volsofdays.where(id: volume.first).first.update(value: volume.second[:value])
    end
    respond_to do |format|
      if @market.update(market_params)
        vols = ""
        @market.volsofdays.each { |vol| vols = vols + "#{vol.value}:" }

        @market.devices.each do |device|
          task = device.tasks.where({ typeofstatus_id: 1, typeoftask_id: 12}).first
          if task.present?
            task.update(typeofstatus_id: 1, options: "<VOLSOFDAY>#{vols[0..-2]}</VOLSOFDAY>")
          else
            device.tasks.create(typeoftask_id: 12, typeofstatus_id: 1, options: "<VOLSOFDAY>#{vols[0..-2]}</VOLSOFDAY>")
          end
        end

        format.html { redirect_to @market, notice: 'Market was successfully updated.' }
        format.json { render :show, status: :ok, location: @market }
      else
        format.html { render :edit }
        format.json { render json: @market.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /markets/1
  # DELETE /markets/1.json
  def destroy
    @market.destroy
    respond_to do |format|
      format.html { redirect_to markets_url, notice: 'Market was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_market
      @market = Market.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def market_params
      params.require(:market).permit(:name, :period)
    end
end
