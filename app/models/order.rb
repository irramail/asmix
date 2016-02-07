class Order < ActiveRecord::Base
  belongs_to :status
  has_many :suborders

  default_scope { order("created_at DESC") }
end
