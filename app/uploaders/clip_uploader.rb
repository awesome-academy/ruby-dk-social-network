class ClipUploader < CarrierWave::Uploader::Base
  # include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(mp4 mov avi flv wmv WebM)
  end
end
