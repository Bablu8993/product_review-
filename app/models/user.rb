class User < ApplicationRecord
  has_secure_password
  validates :user_name, presence: true
  validates_format_of :email, presence: true, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates_uniqueness_of :email
  validates :password, presence: true, confirmation: true, length: {within: 6..20}

end
