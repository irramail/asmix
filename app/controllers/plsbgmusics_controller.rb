class PlsbgmusicsController < ApplicationController
  before_action :set_plsbgmusic, only: [:show, :edit, :update, :destroy]

  # GET /plsbgmusics
  # GET /plsbgmusics.json
  def index
    @plsbgmusics = Plsbgmusic.all
  end

  # GET /plsbgmusics/1
  # GET /plsbgmusics/1.json
  def show
  end

  # GET /plsbgmusics/new
  def new
    @plsbgmusic = Plsbgmusic.new
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
