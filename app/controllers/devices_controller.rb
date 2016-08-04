class DevicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_device, only: [:show, :edit, :update, :destroy]

  # GET /devices
  # GET /devices.json
  def index
    @devices = Device.search(params[:devices_search]).page params[:page]
  end

  # GET /devices/1
  # GET /devices/1.json
  def show
  end

  # GET /devices/new
  def new
    @device = Device.new
  end

  # GET /devices/1/edit
  def edit
  end

  # POST /devices
  # POST /devices.json
  def create
    @device = Device.new(device_params)

    respond_to do |format|
      if @device.save
        #FIXME i18n description
        @device.volumes.create!(description: "Master", name: "Master", value:60)
        @device.volumes.create!(description: "R BG", name: "R", value:60)
        @device.volumes.create!(description: "L BG", name: "L", value:60)
        @device.volumes.create!(description: "RL AD", name: "RL", value:60)
        @device.volumes.create!(description: "RR AD", name: "RR", value:60)

        format.html { redirect_to @device, notice: 'Device was successfully created.' }
        format.json { render :show, status: :created, location: @device }
      else
        format.html { render :new }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devices/1
  # PATCH/PUT /devices/1.json
  def update
    params[:device][:volume].each do |volume|
      @device.volumes.where(id: volume.first).first.update(value: volume.second[:value])
    end
    respond_to do |format|
      if @device.update(device_params)
        vols = ""
        @device.volumes.each { |vol| vols = vols + "<#{vol.name.upcase}>#{vol.value}</#{vol.name.upcase}>" }

        task = @device.tasks.where({ typeofstatus_id: 1, typeoftask_id: 3}).first
        if task.present?
          task.update(typeofstatus_id: 1, options: "<VOLUMES>#{vols}</VOLUMES>")
        else
          @device.tasks.create(typeoftask_id: 3, typeofstatus_id: 1, options: "<VOLUMES>#{vols}</VOLUMES>")
        end

        format.html { redirect_to @device, notice: 'Device was successfully updated.' }
        format.json { render :show, status: :ok, location: @device }
      else
        format.html { render :edit }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devices/1
  # DELETE /devices/1.json
  def destroy
    @device.destroy
    respond_to do |format|
      format.html { redirect_to devices_url, notice: 'Device was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_params
      params.require(:device).permit(:market_id, :name, :ping, :tzdate, :sn, :comment, :active, :eq0, :eq1, :eq2, :eq3, :eq4, :eq5, :eq6, :eq7, :eq8, :eq9, :version)
    end
end
