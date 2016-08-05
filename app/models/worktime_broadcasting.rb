class WorktimeBroadcasting < ActiveRecord::Base
  belongs_to :market

  default_scope { order(:wday) }
end
