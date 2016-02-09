class Suborder < ActiveRecord::Base
  belongs_to :order
  belongs_to :device
  belongs_to :period
  has_many :plists

  has_many :suborders_tasks
  has_many :tasks, through: :suborders_tasks
end
