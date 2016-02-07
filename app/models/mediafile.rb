class Mediafile < ActiveRecord::Base
  belongs_to :content
  has_many :plsbgmusic_devices
  has_many :plsbgmusics, :through => :plsbgmusic_devices
  has_many :tasks
  has_many :plists

  mount_uploader :file, FileUploader

  validate :file_uniqueness, :on => [:create]
  before_save :update_file_attributes

  private
    def file_uniqueness
      #tmp_md5 = Mediafile.where(:md5 => self.file.md5).first
      #tmp_name = Mediafile.where(:file => self.file.filename).first
      #errors.add :md5, "This file already uploaded with name: #{tmp_md5.file}" if tmp_md5
      #errors.add :file, "File with this name already exists: #{tmp_name.file}" if tmp_name

      if Mediafile.where(:file => file.file.original_filename).present?
        errors.add :file_name, "'#{file.file.original_filename}' already exists"
      end
      if Mediafile.where(:md5 => self.file.md5).present?
        errors.add :file_name, "'#{file.file.original_filename}'('#{self.file.md5}') already exists #{Mediafile.where(:md5 => self.file.md5).first.filename}."
      end
    end

    def update_file_attributes
      if file.present? && file_changed?
        self.md5 = file.md5
        self.filename = file.filename
      end
    end

end
