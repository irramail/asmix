class PlsbgmusicDevicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_plsbgmusic_device, only: [:show, :edit, :update, :destroy]

  # GET /plsbgmusic_devices
  # GET /plsbgmusic_devices.json
  def index
    @plsbgmusic_devices = PlsbgmusicDevice.all
  end

  # GET /plsbgmusic_devices/1
  # GET /plsbgmusic_devices/1.json
  def show
  end

  # GET /plsbgmusic_devices/new
  def new
    @plsbgmusic_device = PlsbgmusicDevice.new
  end

  # GET /plsbgmusic_devices/1/edit
  def edit
  end

  # POST /plsbgmusic_devices
  # POST /plsbgmusic_devices.json
  def create
    @plsbgmusic_device = PlsbgmusicDevice.new(plsbgmusic_device_params)

    respond_to do |format|
      if @plsbgmusic_device.save
        format.html { redirect_to @plsbgmusic_device, notice: 'Plsbgmusic device was successfully created.' }
        format.json { render :show, status: :created, location: @plsbgmusic_device }
      else
        format.html { render :new }
        format.json { render json: @plsbgmusic_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plsbgmusic_devices/1
  # PATCH/PUT /plsbgmusic_devices/1.json
  def update
    respond_to do |format|
      if @plsbgmusic_device.update(plsbgmusic_device_params)
        format.html { redirect_to @plsbgmusic_device, notice: 'Plsbgmusic device was successfully updated.' }
        format.json { render :show, status: :ok, location: @plsbgmusic_device }
      else
        format.html { render :edit }
        format.json { render json: @plsbgmusic_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plsbgmusic_devices/1
  # DELETE /plsbgmusic_devices/1.json
  def destroy
    @plsbgmusic_device.destroy
    respond_to do |format|
      format.html { redirect_to plsbgmusic_devices_url, notice: 'Plsbgmusic device was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plsbgmusic_device
      @plsbgmusic_device = PlsbgmusicDevice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plsbgmusic_device_params
      params.require(:plsbgmusic_device).permit(:plsbgmusic_id, :device_id)
    end
end
