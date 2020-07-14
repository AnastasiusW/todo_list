class TaskSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :position, :deadline, :done, :created_at, :updated_at
  belongs_to :project

end
