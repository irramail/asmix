class WorktimeBroadcastingsController < ApplicationController
  #before_action :set_worktime_broadcasting, only: [:show, :edit, :update, :destroy]

  # GET /worktime_broadcastings
  # GET /worktime_broadcastings.json
  # def index
  #   @worktime_broadcastings = WorktimeBroadcasting.all
  # end

  # GET /worktime_broadcastings/1
  # GET /worktime_broadcastings/1.json
  # def show
  # end

  # GET /worktime_broadcastings/new
  # def new
  #   @worktime_broadcasting = WorktimeBroadcasting.new
  # end

  # GET /worktime_broadcastings/1/edit
  # def edit
  # end

  # POST /worktime_broadcastings
  # POST /worktime_broadcastings.json
  def create
    @market = Market.find(params[:market_id])
    @worktime_broadcasting = @market.worktime_broadcastings.create(worktime_broadcasting_params)

    if @market.errors.any?
      render 'markets/show'
    else
      redirect_to market_path(@market)
    end

    # @worktime_broadcasting = WorktimeBroadcasting.new(worktime_broadcasting_params)
    #
    # respond_to do |format|
    #   if @worktime_broadcasting.save
    #     format.html { redirect_to @worktime_broadcasting, notice: 'Worktime broadcasting was successfully created.' }
    #     format.json { render :show, status: :created, location: @worktime_broadcasting }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @worktime_broadcasting.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /worktime_broadcastings/1
  # PATCH/PUT /worktime_broadcastings/1.json
  # def update
  #   respond_to do |format|
  #     if @worktime_broadcasting.update(worktime_broadcasting_params)
  #       format.html { redirect_to @worktime_broadcasting, notice: 'Worktime broadcasting was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @worktime_broadcasting }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @worktime_broadcasting.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /worktime_broadcastings/1
  # DELETE /worktime_broadcastings/1.json
  def destroy
    @market = Market.find(params[:market_id])
    @worktime_broadcasting = @market.worktime_broadcastings.find(params[:id])
    @worktime_broadcasting.destroy
    redirect_to market_path(@market)

    # @worktime_broadcasting.destroy
    # respond_to do |format|
    #   format.html { redirect_to worktime_broadcastings_url, notice: 'Worktime broadcasting was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_worktime_broadcasting
    #   @worktime_broadcasting = WorktimeBroadcasting.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def worktime_broadcasting_params
      params.require(:worktime_broadcasting).permit(:market_id, :wday, :start, :stop)
    end
end
