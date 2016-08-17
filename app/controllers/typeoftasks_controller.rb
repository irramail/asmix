class TypeoftasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_typeoftask, only: [:show, :edit, :update, :destroy]

  # GET /typeoftasks
  # GET /typeoftasks.json
  def index
    @typeoftasks = Typeoftask.all.order(:priority).page params[:page]
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

  def gen
    Typeoftask.create!(name: "SETVOL", priority: "1")
    Typeoftask.create!(name: "DOWNLOADS", priority: "2")
    Typeoftask.create!(name: "PLAYLIST.MUSIC", priority: "3")
    Typeoftask.create!(name: "SYNC.TIME", priority: "4")
    Typeoftask.create!(name: "SETINTERVAL", priority: "5")
    Typeoftask.create!(name: "SETEQU", priority: "6")
    Typeoftask.create!(name: "GETVER", priority: "7")
    Typeoftask.create!(name: "CMD.FOUR", priority: "8")
    Typeoftask.create!(name: "CMD.FIVE", priority: "9")
    Typeoftask.create!(name: "CMD.TWO", priority: "10")
    Typeoftask.create!(name: "CMD.ONE", priority: "11")
    Typeoftask.create!(name: "SET.VOLSOFDAY", priority: "12")
    Typeoftask.create!(name: "WORKTIME", priority: "13")
    Typeoftask.create!(name: "PLAYLIST.BGMUSIC", priority: "14")
    Typeoftask.create!(name: "UPDATE", priority: "15")
    Typeoftask.create!(name: "CMD.SIX", priority: "16")
    Typeoftask.create!(name: "DEL.ALL", priority: "17")
    Typeoftask.create!(name: "PLAYLIST.BGVIDEO", priority: "18")
    Typeoftask.create!(name: "PLAYLIST.BGIMAGE", priority: "19")
    Typeoftask.create!(name: "TJINJLES", priority: "20")
    Typeoftask.create!(name: "TNEWID", priority: "21")
    Typeoftask.create!(name: "TSENDWAVE", priority: "22")
    Typeoftask.create!(name: "TSENDPLSOFDAY", priority: "23")
    Typeoftask.create!(name: "DEL.TASK", priority: "24")
    Typeoftask.create!(name: "TCHGPWD", priority: "25")
    Typeoftask.create!(name: "TMUTEOFF", priority: "26")
    Typeoftask.create!(name: "TFWEIGHT", priority: "27")
    Typeoftask.create!(name: "TCFWEIGHT", priority: "28")
    Typeoftask.create!(name: "TSLEEP", priority: "29")
    Typeoftask.create!(name: "TIMAGEGET", priority: "30")
    Typeoftask.create!(name: "TIMAGEVIEW", priority: "31")
    Typeoftask.create!(name: "EXTDOWNLOADS", priority: "32")
    Typeoftask.create!(name: "DEL.FILES", priority: "33")

    respond_to do |format|
      format.html { redirect_to typeoftasks_url, notice: 'Typeoftask was successfully generated.' }
      format.json { head :no_content }
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
