class TypeoftasksController < ApplicationController
  before_action :set_typeoftask, only: [:show, :edit, :update, :destroy]

  # GET /typeoftasks
  # GET /typeoftasks.json
  def index
    @typeoftasks = Typeoftask.all.order(:priority)
  end

  # GET /typeoftasks/1
  # GET /typeoftasks/1.json
  def show
  end

  # GET /typeoftasks/new
  def new
    @typeoftask = Typeoftask.new
  end

  # GET /typeoftasks/1/edit
  def edit
  end

  # POST /typeoftasks
  # POST /typeoftasks.json
  def create
    @typeoftask = Typeoftask.new(typeoftask_params)

    respond_to do |format|
      if @typeoftask.save
        format.html { redirect_to @typeoftask, notice: 'Typeoftask was successfully created.' }
        format.json { render :show, status: :created, location: @typeoftask }
      else
        format.html { render :new }
        format.json { render json: @typeoftask.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /typeoftasks/1
  # PATCH/PUT /typeoftasks/1.json
  def update
    respond_to do |format|
      if @typeoftask.update(typeoftask_params)
        format.html { redirect_to @typeoftask, notice: 'Typeoftask was successfully updated.' }
        format.json { render :show, status: :ok, location: @typeoftask }
      else
        format.html { render :edit }
        format.json { render json: @typeoftask.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /typeoftasks/1
  # DELETE /typeoftasks/1.json
  def destroy
    @typeoftask.destroy
    respond_to do |format|
      format.html { redirect_to typeoftasks_url, notice: 'Typeoftask was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_typeoftask
      @typeoftask = Typeoftask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def typeoftask_params
      params.require(:typeoftask).permit(:name, :priority)
    end
end
