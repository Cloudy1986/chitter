class User < ApplicationRecord
  has_secure_password
  has_many :peeps, dependent: :destroy
  validates :email, presence: true
  validates :password, presence: true
end
