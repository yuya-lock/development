class Post < ApplicationRecord
  validates :circle_name, :university, :body, presence: true
  validates :circle_name, :university, length: { maximum: 30 }
  validates :body, length: { maximum: 2000 }

  belongs_to :author, class_name: "User", foreign_key: "user_id"
end
