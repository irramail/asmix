class Device < ActiveRecord::Base
  belongs_to :market
  has_many :volumes
  accepts_nested_attributes_for :volumes
  has_many :tasks
  has_many :plsbgmusic_devices
  has_many :plsbgmusics, :through => :plsbgmusic_devices

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      all
    end
  end

  def self.okping(now)
    where('? - updated_at > ping', now)
  end

  def self.badping(now)
    where('? - updated_at < ping', now)
  end
end
