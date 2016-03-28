class VolsofdaysController < ApplicationController
  before_action :authenticate_user!
#  before_action :set_volsofday, only: [:show, :edit, :update, :destroy]

  # GET /volsofdays
  # GET /volsofdays.json
#  def index
#    @volsofdays = Volsofday.all
#  end

  # GET /volsofdays/1
  # GET /volsofdays/1.json
#  def show
#  end

  # GET /volsofdays/new
#  def new
#    @volsofday = Volsofday.new
#  end

  # GET /volsofdays/1/edit
#  def edit
#  end

  # POST /volsofdays
  # POST /volsofdays.json
  def create
    @market = Market.find(params[:market_id])
    @volsofday = @market.volsofdays.create(volsofday_params)

    if @market.errors.any?
      render 'markets/show'
    else
      redirect_to market_path(@market)
    end

#    respond_to do |format|
#      if @volsofday.save
#        format.html { redirect_to @volsofday, notice: 'Volsofday was successfully created.' }
#        format.json { render :show, status: :created, location: @volsofday }
#      else
#        format.html { render :new }
#        format.json { render json: @volsofday.errors, status: :unprocessable_entity }
#      end
#    end
  end

  # PATCH/PUT /volsofdays/1
  # PATCH/PUT /volsofdays/1.json
  def update
    @market = Market.find(params[:market_id])
    @volsofday = @market.volsofdays.find(params[:id])
    @volsofday.update(volsofday_params)

    volsofday = ""
    @market.volsofdays.order(:time).each  { |vol| volsofday += "#{vol.value}:" }

    @market.devices.each do |device|
      task = device.tasks.where({ typeofstatus_id: 1, typeoftask_id: 12}).first
      if task.present?
        task.update(typeofstatus_id: 1, options: "<VOLSOFDAY>#{volsofday[0..-2]}</VOLSOFDAY>")
      else
        device.tasks.create(typeoftask_id: 12, typeofstatus_id: 1, options: "<VOLSOFDAY>#{volsofday[0..-2]}</VOLSOFDAY>")
      end
    end

    redirect_to market_path(@market)

    # respond_to do |format|
    #   if @volsofday.update(volsofday_params)
    #     format.html { redirect_to @volsofday, notice: 'Volsofday was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @volsofday }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @volsofday.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /volsofdays/1
  # DELETE /volsofdays/1.json
  def destroy
    @market = Market.find(params[:market_id])
    @volsofday = @market.volsofdays.find(params[:id])
    @volsofday.destroy
    redirect_to market_path(@market)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
#    def set_volsofday
#      @volsofday = Volsofday.find(params[:id])
#    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def volsofday_params
      params.require(:volsofday).permit(:time, :value, :market_id)
    end
end
