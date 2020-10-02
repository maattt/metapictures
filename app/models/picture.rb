class Picture < ApplicationRecord
  has_one_attached :file
  
  def file_path
    ActiveStorage::Blob.service.send(:path_for, self.file.key)
  end

  def exifs
    EXIFR::JPEG.new(self.file_path)
  end
end
