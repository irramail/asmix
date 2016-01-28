class PlsbgmusicMediafilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_plsbgmusic_mediafile, only: [:show, :edit, :update, :destroy]

  # GET /plsbgmusic_mediafiles
  # GET /plsbgmusic_mediafiles.json
  def index
    @plsbgmusic_mediafiles = PlsbgmusicMediafile.all
  end

  # GET /plsbgmusic_mediafiles/1
  # GET /plsbgmusic_mediafiles/1.json
  def show
  end

  # GET /plsbgmusic_mediafiles/new
  def new
    @plsbgmusic_mediafile = PlsbgmusicMediafile.new
  end

  # GET /plsbgmusic_mediafiles/1/edit
  def edit
  end

  # POST /plsbgmusic_mediafiles
  # POST /plsbgmusic_mediafiles.json
  def create
    @plsbgmusic_mediafile = PlsbgmusicMediafile.new(plsbgmusic_mediafile_params)

    respond_to do |format|
      if @plsbgmusic_mediafile.save
        format.html { redirect_to @plsbgmusic_mediafile, notice: 'Plsbgmusic mediafile was successfully created.' }
        format.json { render :show, status: :created, location: @plsbgmusic_mediafile }
      else
        format.html { render :new }
        format.json { render json: @plsbgmusic_mediafile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plsbgmusic_mediafiles/1
  # PATCH/PUT /plsbgmusic_mediafiles/1.json
  def update
    respond_to do |format|
      if @plsbgmusic_mediafile.update(plsbgmusic_mediafile_params)
        format.html { redirect_to @plsbgmusic_mediafile, notice: 'Plsbgmusic mediafile was successfully updated.' }
        format.json { render :show, status: :ok, location: @plsbgmusic_mediafile }
      else
        format.html { render :edit }
        format.json { render json: @plsbgmusic_mediafile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plsbgmusic_mediafiles/1
  # DELETE /plsbgmusic_mediafiles/1.json
  def destroy
    @plsbgmusic_mediafile.destroy
    respond_to do |format|
      format.html { redirect_to plsbgmusic_mediafiles_url, notice: 'Plsbgmusic mediafile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plsbgmusic_mediafile
      @plsbgmusic_mediafile = PlsbgmusicMediafile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plsbgmusic_mediafile_params
      params.require(:plsbgmusic_mediafile).permit(:plsbgmusic_id, :mediafile_id)
    end
end
