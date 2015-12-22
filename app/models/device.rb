class Device < ActiveRecord::Base
  belongs_to :market
  has_many :volumes
end
