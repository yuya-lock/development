class Post < ApplicationRecord
  validates :circle_name, :university, :body, presence: true
  validates :circle_name, :university, length: { maximum: 30 }
  validates :body, length: { maximum: 2000 }
end
