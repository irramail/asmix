class Device < ActiveRecord::Base
  belongs_to :market
  has_many :volumes
  accepts_nested_attributes_for :volumes
  has_many :tasks
  has_many :plsbgmusic_devices
  has_many :plsbgmusics, :through => :plsbgmusic_devices

  def self.search(search)
    if search
      where('name LIKE ? or id LIKE ?', "%#{search}%", "%#{search}%")
    else
      all
    end
  end

  def self.okping(now)
    where('DATE_FORMAT(?, \'%s\') - DATE_FORMAT(updated_at, \'%s\') < ping * 2', now)
  end

  def self.badping(now)
    where('DATE_FORMAT(?, \'%s\') - DATE_FORMAT(updated_at, \'%s\') > ping * 2', now)
  end
end
