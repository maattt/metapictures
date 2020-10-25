module PicturesHelper
  def human_read(param)
    param.split("/").first.to_f / param.split("/").last.to_f
  end
end
