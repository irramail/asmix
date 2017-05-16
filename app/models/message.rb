class Message < ActiveRecord::Base
  belongs_to :device

  default_scope { order("created_at DESC") }

  def self.search(search)
    if search
      where('text LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
