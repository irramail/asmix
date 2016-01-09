class PlsbgvideosController < ApplicationController
  before_action :set_plsbgvideo, only: [:show, :edit, :update, :destroy]

  # GET /plsbgvideos
  # GET /plsbgvideos.json
  def index
    @plsbgvideos = Plsbgvideo.all
  end

  # GET /plsbgvideos/1
  # GET /plsbgvideos/1.json
  def show
  end

  # GET /plsbgvideos/new
  def new
    @plsbgvideo = Plsbgvideo.new
  end

  # GET /plsbgvideos/1/edit
  def edit
  end

  # POST /plsbgvideos
  # POST /plsbgvideos.json
  def create
    @plsbgvideo = Plsbgvideo.new(plsbgvideo_params)

    respond_to do |format|
      if @plsbgvideo.save
        format.html { redirect_to @plsbgvideo, notice: 'Plsbgvideo was successfully created.' }
        format.json { render :show, status: :created, location: @plsbgvideo }
      else
        format.html { render :new }
        format.json { render json: @plsbgvideo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plsbgvideos/1
  # PATCH/PUT /plsbgvideos/1.json
  def update
    respond_to do |format|
      if @plsbgvideo.update(plsbgvideo_params)
        format.html { redirect_to @plsbgvideo, notice: 'Plsbgvideo was successfully updated.' }
        format.json { render :show, status: :ok, location: @plsbgvideo }
      else
        format.html { render :edit }
        format.json { render json: @plsbgvideo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plsbgvideos/1
  # DELETE /plsbgvideos/1.json
  def destroy
    @plsbgvideo.destroy
    respond_to do |format|
      format.html { redirect_to plsbgvideos_url, notice: 'Plsbgvideo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plsbgvideo
      @plsbgvideo = Plsbgvideo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plsbgvideo_params
      params.require(:plsbgvideo).permit(:name)
    end
end
