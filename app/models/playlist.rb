class Playlist < ActiveRecord::Base
  belongs_to :mediafile
  belongs_to :task
end
