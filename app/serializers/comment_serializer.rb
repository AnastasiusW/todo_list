class CommentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :body, :file, :created_at, :updated_at
  belongs_to :task
end
