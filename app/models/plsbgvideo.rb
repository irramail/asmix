class Plsbgvideo < ActiveRecord::Base
  has_many :plsbgvideo_devices
  has_many :devices, :through => :plsbgvideo_devices

  has_many :plsbgvideo_mediafiles
  has_many :mediafiles, :through => :plsbgvideo_mediafiles

  default_scope { order("created_at DESC") }
end
