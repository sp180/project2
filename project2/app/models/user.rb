class User < ActiveRecord::Base

  has_secure_password
  has_many :posts
  has_many :comments

  # validates: :email, presence: true
  # validates: :email, email_format: {message: "wrong email, yo"}
  # validates: :password, length: {in: 6..20}
  # validates: :password_confirmation, presence: true

end
