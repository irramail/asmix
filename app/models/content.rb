class Content < ActiveRecord::Base
  has_many :mediafiles, dependent: :destroy
  validates :title, presence: true,
            length: {minimum: 5}
end
