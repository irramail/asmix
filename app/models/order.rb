class Order < ActiveRecord::Base
  belongs_to :status
  has_many :suborders
  belongs_to :user

  default_scope { order("created_at DESC") }

  def self.search(search)
    if search
      where('name LIKE ? or id LIKE ?', "%#{search}%", "%#{search}%")
    else
      all
    end
  end
end
