class Volsofday < ActiveRecord::Base
  belongs_to :market

  default_scope { order(:time) }
end
