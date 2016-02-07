class PlistsController < ApplicationController
  before_action :set_plist, only: [:show, :edit, :update, :destroy]

  # GET /plists
  # GET /plists.json
  def index
    @plists = Plist.all
  end

  # GET /plists/1
  # GET /plists/1.json
  def show
  end

  # GET /plists/new
  def new
    @plist = Plist.new
  end

  # GET /plists/1/edit
  def edit
  end

  # POST /plists
  # POST /plists.json
  def create
    @plist = Plist.new(plist_params)

    respond_to do |format|
      if @plist.save
        format.html { redirect_to @plist, notice: 'Plist was successfully created.' }
        format.json { render :show, status: :created, location: @plist }
      else
        format.html { render :new }
        format.json { render json: @plist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plists/1
  # PATCH/PUT /plists/1.json
  def update
    respond_to do |format|
      if @plist.update(plist_params)
        format.html { redirect_to @plist, notice: 'Plist was successfully updated.' }
        format.json { render :show, status: :ok, location: @plist }
      else
        format.html { render :edit }
        format.json { render json: @plist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plists/1
  # DELETE /plists/1.json
  def destroy
    @plist.destroy
    respond_to do |format|
      format.html { redirect_to plists_url, notice: 'Plist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plist
      @plist = Plist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plist_params
      params.require(:plist).permit(:suborder_id, :mediafile_id)
    end
end
