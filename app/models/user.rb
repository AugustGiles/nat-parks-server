class User < ApplicationRecord
  validates :username, uniqueness: true
  has_secure_password
  has_many :user_parks
  has_many :parks, through: :user_parks
end
