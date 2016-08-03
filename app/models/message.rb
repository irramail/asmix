class Message < ActiveRecord::Base
  belongs_to :device

  default_scope { order("created_at DESC") }
end
