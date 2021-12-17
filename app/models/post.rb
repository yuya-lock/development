class Post < ApplicationRecord
  validates :circle_name, :university, :body, presence: true
  validates :circle_name, :university, length: { maximum: 30 }
  validates :body, length: { maximum: 2000 }
  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png], message: "must be a valid image format" }, size:         { less_than: 5.megabytes, message: "should be less than 5MB" }

  belongs_to :author, class_name: "User", foreign_key: "user_id"
  has_one_attached :image

  def display_image
    image.variant(resize_to_limit: [500, 500])
  end
end
