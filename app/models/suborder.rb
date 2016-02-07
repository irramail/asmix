class Suborder < ActiveRecord::Base
  belongs_to :order
  belongs_to :device
  belongs_to :period
  has_many :plists
end
