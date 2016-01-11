class PlsbgimagesController < ApplicationController
  before_action :set_plsbgimage, only: [:show, :edit, :update, :destroy]

  # GET /plsbgimages
  # GET /plsbgimages.json
  def index
    @plsbgimages = Plsbgimage.all
  end

  # GET /plsbgimages/1
  # GET /plsbgimages/1.json
  def show
  end

  # GET /plsbgimages/new
  def new
    @plsbgimage = Plsbgimage.new
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
