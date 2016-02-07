class Plist < ActiveRecord::Base
  belongs_to :suborder
  belongs_to :mediafile
end
