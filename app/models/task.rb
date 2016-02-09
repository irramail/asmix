class Task < ActiveRecord::Base
  belongs_to :device
  belongs_to :typeoftask
  belongs_to :typeofstatus
  belongs_to :mediafile

  has_many :suborders_tasks
  has_many :suborders, through: :suborders_tasks

  default_scope { order("created_at DESC") }

end
