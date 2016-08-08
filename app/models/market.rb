class Market < ActiveRecord::Base
  has_many :volsofdays
  accepts_nested_attributes_for :volsofdays
  has_many :worktime_broadcastings
  accepts_nested_attributes_for :worktime_broadcastings
  has_many :devices
end
