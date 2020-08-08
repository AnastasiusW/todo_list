class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_name, :password_digest, :created_at, :updated_at
  has_many :projects
end
