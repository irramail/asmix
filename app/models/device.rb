class Device < ActiveRecord::Base
  belongs_to :market
  has_many :volumes
  has_many :tasks
  has_many :plsbgmusic_devices
  has_many :plsbgmusics, :through => :plsbgmusic_devices
end
