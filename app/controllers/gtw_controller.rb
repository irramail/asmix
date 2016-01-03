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
    p '1------------------------'



    case params[:task]
      when 'getStatus'
        id = hash['STATUS']['ID'].to_i
        not_found if Device.where(:id => id).blank?
        Device.where(:id => id).first.touch

        if Task.where(:device_id => id, :typeofstatus_id => 1).present?
          render plain: '<STATUS><TASKS/></STATUS>'
        else
          render xml: done_status
        end
      when 'getJob'
        id = hash['STATUS']['ID'].to_i
        not_found if Device.where(:id => id).blank?
        Device.where(:id => id).first.touch

        tasks = Task.where(:device_id => id, :typeofstatus_id => 1)
        if tasks.present?
          Typeoftask.all.order(:priority).each do |at_ttype|
            sub_tasks = tasks.where(:typeoftask_id => at_ttype)
            if sub_tasks.present?
              task = sub_tasks.first
              Task.update(task.id, :typeofstatus_id => 2)
              render plain: "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<TASKS><TASK><TASK_ID>#{task.id}</TASK_ID><TYPE>#{at_ttype.name}</TYPE>#{task.options}</TASK></TASKS>"
              break
            end
          end
        else
          render not_found
        end
      when 'setStatus'
        id = hash['TASKS']['ID'].to_i
        not_found if Device.where(:id => id).blank?
        Device.where(:id => id).first.touch
        task_id = hash['TASKS']['TASK']['TASK_ID'].to_i
        status = hash['TASKS']['TASK']['STATUS']
        lstatus = Typeofstatus.where(:name => status).first

        priority = lstatus.priority if (status.present? && lstatus.present?)
        Task.update(task_id, :typeofstatus_id => priority) if (status == 'PROGRESS' || status == 'COMPLETED')

        render xml: done_status1
      when 'setJob'
        render xml: done_status
      else
        not_found
    end
  end
end
