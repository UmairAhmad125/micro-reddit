require 'bcrypt'

class User < ApplicationRecord
  include BCrypt

  has_many :posts
  before_save :secure_password

  validates :username, presence: true, uniqueness: { case_sensitive: false },
                       length: { minimum: 4, maximum: 12 }

  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze }

  validates :password, presence: true, length: { minimum: 4, maximum: 12 }

  def secure_password
    self.password = Password.create(password)
  end
end
