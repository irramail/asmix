class Plsbgvideo < ActiveRecord::Base
  has_many :plsbgvideo_devices
  has_many :devices, :through => :plsbgvideo_devices

  has_many :plsbgvideo_mediafiles
  has_many :mediafiles, :through => :plsbgvideo_mediafiles

  default_scope { order("created_at DESC") }

  def self.search(search)
    if search
      where('name LIKE ? or id LIKE ?', "%#{search}%", "%#{search}%")
    else
      all
    end
  end
end
