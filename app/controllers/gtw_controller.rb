class GtwController < ApplicationController
  skip_before_action  :verify_authenticity_token

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def index
    done_status="<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<STATUS><DONE /></STATUS>"
    done_status1="<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<STATUS><DONE/></STATUS>"
    xml=params[:data]
    hash = Hash.from_xml(xml)

    case params[:task]
      when 'getStatus'
        id = hash['STATUS']['ID'].to_i
        not_found if Device.where(:id => id, :active => true).blank?
        Device.where(:id => id).first.touch

        if Task.where(:device_id => id, :typeofstatus_id => 1).present?
          render plain: '<STATUS><TASKS/></STATUS>'
        else
          render xml: done_status
        end
      when 'getJob'
        id = hash['STATUS']['ID'].to_i
        not_found if Device.where(:id => id, :active => true).blank?
        Device.where(:id => id).first.touch

        tasks = Task.where(:device_id => id, :typeofstatus_id => 1) if Task.where(:device_id => id, :typeofstatus_id => 3).empty?
        if tasks.present?
          Typeoftask.all.order(:priority).each do |at_ttype|
            sub_tasks = tasks.where(:typeoftask_id => at_ttype)
            if sub_tasks.present?
              task = sub_tasks.first

              #<STIME>2012-10-15 04:15:04</STIME>(device.updated_at + 3600 * device.tzdate).to_s[0..18]
              if at_ttype.id == 4
                task.options="<STIME>#{(Time.now.utc + 3600 * task.device.tzdate).to_s[0..18]}</STIME>"
                task.save
              end

              #Task.update(task.id, :typeofstatus_id => 2)
              render plain: "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<TASKS><TASK><TASK_ID>#{task.id}</TASK_ID><TYPE>#{at_ttype.name}</TYPE>#{task.options}</TASK></TASKS>"
              break
            end
          end
        else
          render not_found
        end
      when 'setStatus'
        id = hash['TASKS']['ID'].to_i
        not_found if Device.where(:id => id, :active => true).blank?
        Device.where(:id => id).first.touch
        task_id = hash['TASKS']['TASK']['TASK_ID'].to_i
        status = hash['TASKS']['TASK']['STATUS']
        lstatus = Typeofstatus.where(:name => status).first

        priority = lstatus.priority if (status.present? && lstatus.present?)
        Task.update(task_id, :typeofstatus_id => priority) if ( status == 'RECEIVED' || status == 'PROGRESS' || status == 'COMPLETED')

        render xml: done_status1
      when 'setJob'
        #<?xml version="1.0" encoding="UTF-8"?><JOB><ID>1</ID><VERSION>0.0.3491s</VERSION></JOB>
        id = hash['JOB']['ID'].to_i
        not_found if Device.where(:id => id, :active => true).blank?

        device = Device.where(:id => id).first
        device.touch

        version = hash['JOB']['VERSION'].to_s
        if version.length > 0
          device.version = version
          device.save
        end
        render xml: done_status
      else
        not_found
    end
  end
end