class Task < ActiveRecord::Base
  belongs_to :device
  belongs_to :typeoftask
  belongs_to :typeofstatus

  default_scope { order("created_at DESC") }

end
