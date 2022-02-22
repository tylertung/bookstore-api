class User < ApplicationRecord
  has_secure_password :password
  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, :dob, :gender, :password, presence: true

end
