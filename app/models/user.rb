class User < ApplicationRecord
  has_secure_password :password
  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, :dob, :gender,  presence: true
  validates :password, length: { minimum: 6, message: 'minimum is 6 characters' }
  validates :password_confirmation, length: { minimum: 6, message: 'minimum is 6 characters' }
end