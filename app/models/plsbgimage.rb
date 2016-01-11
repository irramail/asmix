class Plsbgimage < ActiveRecord::Base
  has_many :plsbgimage_devices
  has_many :devices, :through => :plsbgimage_devices

  has_many :plsbgimage_mediafiles
  has_many :mediafiles, :through => :plsbgimage_mediafiles

  default_scope { order("created_at DESC") }
end
