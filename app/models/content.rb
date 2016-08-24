class Content < ActiveRecord::Base
  has_many :mediafiles, dependent: :destroy
  accepts_nested_attributes_for :mediafiles
  validates :title, presence: true,
            length: {minimum: 5}
end
