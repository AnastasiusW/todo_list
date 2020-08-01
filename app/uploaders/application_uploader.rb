class ApplicationUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    if Rails.env.test?
      "test/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    else
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end
  end

  def extension_whitelist
    %w[jpg jpeg png]
  end

  def cache_dir
    'test/uploads/cache'
  end
end
