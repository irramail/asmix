class PlsbgmusicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_plsbgmusic, only: [:show, :edit, :update, :destroy]

  # GET /plsbgmusics
  # GET /plsbgmusics.json
  def index
    @plsbgmusics = Plsbgmusic.all.page params[:page]
  end

  # GET /plsbgmusics/1
  # GET /plsbgmusics/1.json
  def show
  end

  # GET /plsbgmusics/new
  def new
    @plsbgmusic = Plsbgmusic.new
    @old_order = Plsbgmusic.find(params[:old_id]) if params[:old_id]
  end

  # GET /plsbgmusics/1/edit
  def edit
  end

  # POST /plsbgmusics
  # POST /plsbgmusics.json
  def create
    @plsbgmusic = Plsbgmusic.new(plsbgmusic_params)

    respond_to do |format|
      if @plsbgmusic.save
        tracks=""
        @plsbgmusic.mediafiles.each do |mediafile|
          tracks += "<TRACK><HASH>#{mediafile.md5}</HASH></TRACK>"
        end

        @plsbgmusic.devices.each do |device|
          device.tasks.create(typeoftask_id: 14, typeofstatus_id: 1, user_id: current_user.id,  options: "<TRACKS>#{tracks}</TRACKS>")
          @plsbgmusic.mediafiles.each do |mediafile|
            if device.tasks.where(mediafile_id: mediafile.id).empty?
              device.tasks.create(typeoftask_id: 1, typeofstatus_id: 1, user_id: current_user.id, options: "<URLS><URL>#{mediafile.file}|#{mediafile.md5[-4..-1]}</URL><NAME>#{mediafile.filename}</NAME></URLS>", mediafile_id: mediafile.id)
              #device.tasks.create(typeoftask_id: 1, typeofstatus_id: 1, options: "<URLS><URL>http://192.168.0.91:3000#{mediafile.file}|#{mediafile.md5[-4..-1]}</URL></URLS>", mediafile_id: mediafile.id)
            end
          end
        end
        format.html { redirect_to @plsbgmusic, notice: 'Plsbgmusic was successfully created.' }
        format.json { render :show, status: :created, location: @plsbgmusic }
      else
        format.html { render :new }
        format.json { render json: @plsbgmusic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plsbgmusics/1
  # PATCH/PUT /plsbgmusics/1.json
  def update
    respond_to do |format|
      if @plsbgmusic.update(plsbgmusic_params)
        format.html { redirect_to @plsbgmusic, notice: 'Plsbgmusic was successfully updated.' }
        format.json { render :show, status: :ok, location: @plsbgmusic }
      else
        format.html { render :edit }
        format.json { render json: @plsbgmusic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plsbgmusics/1
  # DELETE /plsbgmusics/1.json
  def destroy
    @plsbgmusic.destroy
    respond_to do |format|
      format.html { redirect_to plsbgmusics_url, notice: 'Plsbgmusic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plsbgmusic
      @plsbgmusic = Plsbgmusic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plsbgmusic_params
      params.require(:plsbgmusic).permit(:name, :device_ids => [], :mediafile_ids => [])
    end
end
