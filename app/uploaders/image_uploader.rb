class ImageUploader < ApplicationUploader
  version :medium_img do
    process resize_to_fit: [300, 300]
  end
end
