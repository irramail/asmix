class Device < ActiveRecord::Base
  belongs_to :market
  has_many :volumes
  has_many :tasks
end
