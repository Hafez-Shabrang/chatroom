class User < ApplicationRecord
  paginates_per 5
  has_many :messages
  has_secure_password
  validates :username, presence: true, length: {minimum: 4, maximum: 15}
  validates :email, presence: true, length: {minimum: 10, maximum: 30}
end
