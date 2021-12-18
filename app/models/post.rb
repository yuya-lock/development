class Post < ApplicationRecord
  validates :circle_name, :university, :body, presence: true
  validates :circle_name, :university, length: { maximum: 30 }
  validates :body, length: { maximum: 2000 }
  
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  has_one_attached :image
  attribute :new_image

  before_save do
    if new_image
      self.image = new_image
    end
  end
end
