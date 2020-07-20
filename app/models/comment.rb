class Comment < ApplicationRecord
  belongs_to :task
  mount_uploader :file, ImageUploader

  SIZE_FILE = 10.megabytes
  LENGTH_COMMENT = (10..256).freeze

  validates :body, presence: true
  validates :body, length: { in: LENGTH_COMMENT }
  validates_size_of :file, maximum: SIZE_FILE, message: I18n.t('errors.comment.file_size')
end
