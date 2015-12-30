class VolumesController < ApplicationController
#  before_action :set_volume, only: [:show, :edit, :update, :destroy]

  # GET /volumes
  # GET /volumes.json
  # def index
  #   @volumes = Volume.all
  # end

  # GET /volumes/1
  # GET /volumes/1.json
  # def show
  # end

  # GET /volumes/new
  # def new
  #   @volume = Volume.new
  # end

  # GET /volumes/1/edit
  # def edit
  # end

  # POST /volumes
  # POST /volumes.json
  def create
    @device= Device.find(params[:device_id])
    @volume = @device.volumes.create(volume_params)

    if @device.errors.any?
      render 'devices/show'
    else
      redirect_to device_path(@device)
    end

    # @volume = Volume.new(volume_params)
    #
    # respond_to do |format|
    #   if @volume.save
    #     format.html { redirect_to @volume, notice: 'Volume was successfully created.' }
    #     format.json { render :show, status: :created, location: @volume }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @volume.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /volumes/1
  # PATCH/PUT /volumes/1.json
  def update
    @device = Device.find(params[:device_id])
    @volume = @device.volumes.find(params[:id])
    @volume.update(volume_params)

    #<VOLUMES><MASTER>1</MASTER><R>2</R><L>3</L><RL>4</RL><RR>5</RR></VOLUMES>
    vols = ""
    @device.volumes.each { |vol| vols = vols + "<#{vol.name.upcase}>#{vol.value}</#{vol.name.upcase}>" }
    @device.tasks.create(typeoftask_id: 3, typeofstatus_id: 1, options: "<VOLUMES>#{vols}</VOLUMES>")

    redirect_to device_path(@device)
  #   respond_to do |format|
  #     if @volume.update(volume_params)
  #       format.html { redirect_to @volume, notice: 'Volume was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @volume }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @volume.errors, status: :unprocessable_entity }
  #     end
  #   end
  end

  # DELETE /volumes/1
  # DELETE /volumes/1.json
  def destroy

    @device = Device.find(params[:device_id])
    @volume = @device.volumes.find(params[:id])
    @volume.destroy
    redirect_to device_path(@device)

    # @volume.destroy
    # respond_to do |format|
    #   format.html { redirect_to volumes_url, notice: 'Volume was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_volume
    #   @volume = Volume.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def volume_params
      params.require(:volume).permit(:device_id, :description, :name, :value)
    end
end
