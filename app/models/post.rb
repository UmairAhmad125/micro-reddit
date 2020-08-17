class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :body, presence: true
end
