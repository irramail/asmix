class Volume < ActiveRecord::Base
  belongs_to :device

  validates_numericality_of :value, only_integer: true
  validates_numericality_of :value, less_than_or_equal_to: 100
  validates_numericality_of :value, greater_than_or_equal_to: 0
end
