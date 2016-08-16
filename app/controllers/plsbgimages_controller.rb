class PlsbgimagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_plsbgimage, only: [:show, :edit, :update, :destroy]

  # GET /plsbgimages
  # GET /plsbgimages.json
  def index
    @plsbgimages = Plsbgimage.all.all.page params[:page]
  end

  # GET /plsbgimages/1
  # GET /plsbgimages/1.json
  def show
  end

  # GET /plsbgimages/new
  def new
    @plsbgimage = Plsbgimage.new
    @old_order = Plsbgimage.find(params[:old_id]) if params[:old_id]
  end

  # GET /plsbgimages/1/edit
  def edit
  end

  # POST /plsbgimages
  # POST /plsbgimages.json
  def create
    @plsbgimage = Plsbgimage.new(plsbgimage_params)

    respond_to do |format|
      if @plsbgimage.save
#<TYPE>PLAYLIST.BGIMAGE</TYPE><IMGS><IMG><HASH>ecccf33bbea8496bef4b8d76c315fb39</HASH></IMG>
        tracks=""
        @plsbgimage.mediafiles.each do |mediafile|
          tracks += "<IMG><HASH>#{mediafile.md5}</HASH></IMG>"
        end

        @plsbgimage.devices.each do |device|
          device.tasks.create(typeoftask_id: 19, typeofstatus_id: 1, user_id: current_user.id, options: "<IMGS>#{tracks}</IMGS>")
          @plsbgimage.mediafiles.each do |mediafile|
            if device.tasks.where(mediafile_id: mediafile.id).empty?
              device.tasks.create(typeoftask_id: 1, typeofstatus_id: 1, user_id: current_user.id, options: "<URLS><URL>#{mediafile.file}|#{mediafile.md5[-4..-1]}</URL></URLS>", mediafile_id: mediafile.id)
              #device.tasks.create(typeoftask_id: 1, typeofstatus_id: 1, options: "<URLS><URL>http://192.168.0.91:3000#{mediafile.file}|#{mediafile.md5[-4..-1]}</URL></URLS>", mediafile_id: mediafile.id)
            end
          end
        end
        format.html { redirect_to @plsbgimage, notice: 'Plsbgimage was successfully created.' }
        format.json { render :show, status: :created, location: @plsbgimage }
      else
        format.html { render :new }
        format.json { render json: @plsbgimage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plsbgimages/1
  # PATCH/PUT /plsbgimages/1.json
  def update
    respond_to do |format|
      if @plsbgimage.update(plsbgimage_params)
        format.html { redirect_to @plsbgimage, notice: 'Plsbgimage was successfully updated.' }
        format.json { render :show, status: :ok, location: @plsbgimage }
      else
        format.html { render :edit }
        format.json { render json: @plsbgimage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plsbgimages/1
  # DELETE /plsbgimages/1.json
  def destroy
    @plsbgimage.destroy
    respond_to do |format|
      format.html { redirect_to plsbgimages_url, notice: 'Plsbgimage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plsbgimage
      @plsbgimage = Plsbgimage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plsbgimage_params
      params.require(:plsbgimage).permit(:name, :device_ids => [], :mediafile_ids => [])
    end
end
