class Mediafile < ActiveRecord::Base
  belongs_to :content
  has_many :plsbgmusic_devices
  has_many :plsbgmusics, :through => :plsbgmusic_devices

  has_many :plsbgmusic_mediafiles
  has_many :plsbgmusics, :through => :plsbgmusic_mediafiles

  has_many :plsbgvideo_mediafiles
  has_many :plsbgvideos, :through => :plsbgvideo_mediafiles

  has_many :tasks
  has_many :plists
  default_scope { order("created_at DESC") }
  #mount_uploader :file, FileUploader

  before_validation(on: :create) do
    self.file = file.gsub('https://drive.google.com/open?id=', 'https://drive.google.com/uc?id=') if attribute_present?("file")
  end

#  validate :file_uniqueness, :en => [:create]
#  before_save :update_file_attributes

  def self.search(search)
    if search
      where('filename LIKE ?', "%#{search}%")
    else
      all
    end
  end

  private
    def file_uniqueness
      #tmp_md5 = Mediafile.where(:md5 => self.file.md5).first
      #tmp_name = Mediafile.where(:file => self.file.filename).first
      #errors.add :md5, "This file already uploaded with name: #{tmp_md5.file}" if tmp_md5
      #errors.add :file, "File with this name already exists: #{tmp_name.file}" if tmp_name

      #if Mediafile.where(:file => file.file.original_filename).present?
      #  errors.add :file_name, "'#{file.file.original_filename}' already exists"
      #end
      #if Mediafile.where(:md5 => self.file.md5).present?
      #  errors.add :file_name, "'#{file.file.original_filename}'('#{self.file.md5}') already exists #{Mediafile.where(:md5 => self.file.md5).first.filename}."
      #end
    end

    def update_file_attributes
      #if file.present? && file_changed?
      #  self.md5 = file.md5
      #  self.filename = file.filename
      #end
    end

end
