class SubordersController < ApplicationController
  before_action :set_suborder, only: [:show, :edit, :update, :destroy]

  # GET /suborders
  # GET /suborders.json
  def index
    @suborders = Suborder.all
  end

  # GET /suborders/1
  # GET /suborders/1.json
  def show
  end

  # GET /suborders/new
  def new
    @suborder = Suborder.new
  end

  # GET /suborders/1/edit
  def edit
  end

  # POST /suborders
  # POST /suborders.json
  def create
    @suborder = Suborder.new(suborder_params)

    respond_to do |format|
      if @suborder.save
        format.html { redirect_to @suborder, notice: 'Suborder was successfully created.' }
        format.json { render :show, status: :created, location: @suborder }
      else
        format.html { render :new }
        format.json { render json: @suborder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suborders/1
  # PATCH/PUT /suborders/1.json
  def update
    respond_to do |format|
      if @suborder.update(suborder_params)
        format.html { redirect_to @suborder, notice: 'Suborder was successfully updated.' }
        format.json { render :show, status: :ok, location: @suborder }
      else
        format.html { render :edit }
        format.json { render json: @suborder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suborders/1
  # DELETE /suborders/1.json
  def destroy
    @suborder.destroy
    respond_to do |format|
      format.html { redirect_to suborders_url, notice: 'Suborder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_suborder
      @suborder = Suborder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def suborder_params
      params.require(:suborder).permit(:order_id, :device_id, :period_id, :startdt, :stopdt, :startt, :stopt)
    end
end
