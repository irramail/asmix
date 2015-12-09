class Mediafile < ActiveRecord::Base
  belongs_to :content
  mount_uploader :file, FileUploader

  validate :file_uniqueness
  before_save :update_file_attributes

  private
    def file_uniqueness
      tmp_md5 = Mediafile.where(:md5 => self.file.md5).first
      tmp_name = Mediafile.where(:file => self.file.filename).first
      errors.add :md5, "This file already uploaded with name: #{tmp_md5.file}" if tmp_md5
      errors.add :file, "File with this name already exists: #{tmp_name.file}" if tmp_name
    end

    def update_file_attributes
      if file.present? && file_changed?
        self.md5 = file.md5
      end
    end

end
