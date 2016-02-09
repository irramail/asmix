class SubordersTask < ActiveRecord::Base
  belongs_to :suborder
  belongs_to :task
end
