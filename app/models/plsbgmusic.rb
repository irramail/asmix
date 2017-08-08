class Plsbgmusic < ActiveRecord::Base
  has_many :plsbgmusic_devices
  has_many :devices, :through => :plsbgmusic_devices

  has_many :plsbgmusic_mediafiles
  has_many :mediafiles, :through => :plsbgmusic_mediafiles

  default_scope { order("created_at DESC") }

  def self.search(search)
    if search
      where('name LIKE ? or id LIKE ?', "%#{search}%", "%#{search}%")
    else
      all
    end
  end

end
