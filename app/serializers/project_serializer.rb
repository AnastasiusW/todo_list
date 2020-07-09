class ProjectSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :created_at, :updated_at
  belongs_to :user
end
