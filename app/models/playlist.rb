class Playlist < ActiveRecord::Base
  belongs_to :mediafile
  belongs_to :task

  default_scope { order("created_at DESC") }
end
