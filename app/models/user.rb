class User < ApplicationRecord
  has_secure_password :password
  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, :dob, :gender, :password, presence: true
  validates :first_name, :last_name, length: { minimum: 2, message: "minimum is 2 characters" }
  validates :password, length: { minimum: 6, message: 'minimum is 6 characters' }
end
