class Market < ActiveRecord::Base
  has_many :volsofdays
  has_many :worktime_broadcastings
end
