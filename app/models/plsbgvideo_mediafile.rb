class PlsbgvideoMediafile < ActiveRecord::Base
  belongs_to :plsbgvideo
  belongs_to :mediafile
end
