class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :medium_img do
    process resize_to_fit: [300, 300]
  end

  def extension_whitelist
    %w[jpg jpeg png]
  end
end
