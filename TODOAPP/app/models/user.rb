class User < ApplicationRecord
  has_secure_password
  validates :email , {uniqueness: true}
  validates :password_digest , {presence: true}
end
