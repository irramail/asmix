class Period < ActiveRecord::Base
  has_many  :suborders
end
