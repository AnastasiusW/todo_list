class User < ApplicationRecord

  USER_LENGTH_MIN = 3
  USER_LENGTH_MAX = 50
  PASSWORD_LENGTH_MIN = 8

  has_secure_password
  validates :user_name,presence:true, uniqueness: true, length: {minimum: USER_LENGTH_MIN, maximum: USER_LENGTH_MAX}
  validates :password, length: {minimum: PASSWORD_LENGTH_MIN}, presence:true

end
