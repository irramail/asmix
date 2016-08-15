class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    if params[:device_id]
      @tasks = Task.where(device_id: params[:device_id]).search(params[:search]).page params[:page]
    else
      @tasks = Task.search(params[:search]).all.page params[:page]
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /tasks
  # POST /tasks.json
  def create_setvol
    @task = Task.new(task_params)

    vols = ""
    @task.device.volumes.each { |vol| vols = vols + "<#{vol.name.upcase.delete(' ')}>#{vol.value}</#{vol.name.upcase.delete(' ')}>" }
    @task.options="<VOLUMES>#{vols}</VOLUMES>"
    @task.user_id = current_user.id

    respond_to do |format|
      if @task.save
        format.html { redirect_to devices_path, notice: 'Task was successfully created.' }
        format.json { render :index, status: :created, location: @task.devices }
      else
        format.html { render :index, location: @task.devices }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /tasks
  # POST /tasks.json
  def create_setinterval
    @task = Task.new(task_params)
    @task.options="<INTERVAL>#{@task.device.ping}</INTERVAL>"
    @task.options = current_user.id

    respond_to do |format|
      if @task.save
        format.html { redirect_to devices_path, notice: 'Task was successfully created.' }
        format.json { render :index, status: :created, location: @task.devices }
      else
        format.html { render :index, location: @task.devices }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /tasks
  # POST /tasks.json
  def create_setequalizer
    @task = Task.new(task_params)
    #<0>0</0><1>0</1><2>0</2><3>0</3><4>0</4><5>0</5><6>0</6><7>0</7><8>0</8><9>0</9>
    eq = "<0>#{@task.device.eq0}</0><1>#{@task.device.eq1}</1><2>#{@task.device.eq2}</2><3>#{@task.device.eq3}</3><4>#{@task.device.eq4}</4><5>#{@task.device.eq5}</5><6>#{@task.device.eq6}</6><7>#{@task.device.eq7}</7><8>#{@task.device.eq8}</8><9>#{@task.device.eq9}</9>"
    @task.options="<EQUALIZER>#{eq}</EQUALIZER>"
    @task.user_id = current_user.id

    respond_to do |format|
      if @task.save
        format.html { redirect_to devices_path, notice: 'Task was successfully created.' }
        format.json { render :index, status: :created, location: @task.devices }
      else
        format.html { render :index, location: @task.devices }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /tasks
  # POST /tasks.json
  def create_reboot
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    #

    respond_to do |format|
      if @task.save
        format.html { redirect_to devices_path, notice: 'Task was successfully created.' }
        format.json { render :index, status: :created, location: @task.devices }
      else
        format.html { render :index, location: @task.devices }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_synctime
    create_reboot
  end

  def create_getver
    create_reboot
  end

  def create_getinfo
    create_reboot
  end

  def create_ssh
    create_reboot
  end

  def create_setvolsofday
    @task = Task.new(task_params)
    #<TYPE>SET.VOLSOFDAY</TYPE><VOLSOFDAY>0:0:0:0:0:0:0:0:0:80:80:80:80:80:80:80:80:80:0:0:0:0:0:0</VOLSOFDAY>
    volsofday = ""
    @task.device.market.volsofdays.order(:time).each  { |vol| volsofday += "#{vol.value}:" }
    @task.options="<VOLSOFDAY>#{volsofday[0..-2]}</VOLSOFDAY>"
    @task.user_id = current_user.id

    respond_to do |format|
      if @task.save
        format.html { redirect_to devices_path, notice: 'Task was successfully created.' }
        format.json { render :index, status: :created, location: @task.devices }
      else
        format.html { render :index, location: @task.devices }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_worktime
    @task = Task.new(task_params)
    #<DAYS><MON><BEGIN>09:00:00</BEGIN><END>18:00:00</END></MON><TUE><BEGIN>09:00:00</BEGIN><END>18:00:00</END></TUE><WED><BEGIN>09:00:00</BEGIN><END>18:00:00</END></WED><THU><BEGIN>09:00:00</BEGIN><END>18:00:00</END></THU><FRI><BEGIN>09:00:00</BEGIN><END>18:00:00</END></FRI><SAT><BEGIN>09:00:00</BEGIN><END>18:00:00</END></SAT><SUN><BEGIN>09:00:00</BEGIN><END>18:00:00</END></SUN></DAYS>
    @task.user_id = current_user.id

    day = ""
    stringdays = "SUNMONTUEWEDTHUFRISAT"
    worktime = ""
    i = 0;

    @task.device.market.worktime_broadcastings.order(:wday).each  { |wt|
      day = stringdays[i*3..i*3+2]
      worktime += "<#{day}><BEGIN>#{wt.start}:00</BEGIN><END>#{wt.stop}:00</END></#{day}>"
      i+=1
    }

    @task.options="<DAYS>#{worktime}</DAYS>"

    respond_to do |format|
      if @task.save
        format.html { redirect_to devices_path, notice: 'Task was successfully created.' }
        format.json { render :index, status: :created, location: @task.devices }
      else
        format.html { render :index, location: @task.devices }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_update
    create_reboot
  end

  # DEL.ALL
  def create_delall
    create_reboot
  end

  # CANCEL.ALL
  def create_cancelall
    tasks = Task.where(device_id: task_params[:device_id], typeofstatus_id: 1)
    tasks += Task.where(device_id: task_params[:device_id], typeofstatus_id: 2, typeoftask_id: 1) #downloads RECEIVED
    tasks += Task.where(device_id: task_params[:device_id], typeofstatus_id: 3, typeoftask_id: 1) #downloads PROGRESS

    success = true

    tasks.each do |task|
      success = false unless task.update(typeofstatus_id: 5, user_id: current_user.id)
    end

    respond_to do |format|
      if success
        format.html { redirect_to devices_path, notice: 'Tasks was successfully canceled.' }
        format.json { render :index, status: :created, location: @task.devices }
      else
        format.html { render :index, location: @task.devices }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end

  end

  def create_gettrack
    create_reboot
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to tasks_url, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:device_id, :typeoftask_id, :typeofstatus_id, :user_id, :options)
    end
end
