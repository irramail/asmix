class TypeofstatusesController < ApplicationController
  before_action :set_typeofstatus, only: [:show, :edit, :update, :destroy]

  # GET /typeofstatuses
  # GET /typeofstatuses.json
  def index
    @typeofstatuses = Typeofstatus.all
  end

  # GET /typeofstatuses/1
  # GET /typeofstatuses/1.json
  def show
  end

  # GET /typeofstatuses/new
  def new
    @typeofstatus = Typeofstatus.new
  end

  # GET /typeofstatuses/1/edit
  def edit
  end

  # POST /typeofstatuses
  # POST /typeofstatuses.json
  def create
    @typeofstatus = Typeofstatus.new(typeofstatus_params)

    respond_to do |format|
      if @typeofstatus.save
        format.html { redirect_to @typeofstatus, notice: 'Typeofstatus was successfully created.' }
        format.json { render :show, status: :created, location: @typeofstatus }
      else
        format.html { render :new }
        format.json { render json: @typeofstatus.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /typeofstatuses/1
  # PATCH/PUT /typeofstatuses/1.json
  def update
    respond_to do |format|
      if @typeofstatus.update(typeofstatus_params)
        format.html { redirect_to @typeofstatus, notice: 'Typeofstatus was successfully updated.' }
        format.json { render :show, status: :ok, location: @typeofstatus }
      else
        format.html { render :edit }
        format.json { render json: @typeofstatus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /typeofstatuses/1
  # DELETE /typeofstatuses/1.json
  def destroy
    @typeofstatus.destroy
    respond_to do |format|
      format.html { redirect_to typeofstatuses_url, notice: 'Typeofstatus was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_typeofstatus
      @typeofstatus = Typeofstatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def typeofstatus_params
      params.require(:typeofstatus).permit(:name, :priority)
    end
end
